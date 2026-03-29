const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");
const bcrypt = require("bcrypt");

const app = express();

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json()); // IMPORTANT for fetch JSON

const path = require("path");

// Serve frontend folder
app.use(express.static(path.join(__dirname, "../public")));

// DB connection
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "AnanyaMad@2006",
    database: "taal_db"
});

db.connect(err => {
    if (err) throw err;
    console.log("Connected to MySQL");
});

// ================= ROUTES =================

// Register
app.post("/register", async (req, res) => {
    const { username, password } = req.body;

    const hashedPassword = await bcrypt.hash(password, 10);

    const sql = "INSERT INTO users (username, password) VALUES (?, ?)";

    db.query(sql, [username, hashedPassword], (err) => {
        if (err) return res.send("User already exists or error!");
        res.redirect("/login.html");
    });
});

// Login
app.post("/login", (req, res) => {
    const { username, password } = req.body;

    const sql = "SELECT * FROM users WHERE username = ?";

    db.query(sql, [username], async (err, result) => {
        if (result.length === 0) return res.send("User not found");

        const user = result[0];
        const match = await bcrypt.compare(password, user.password);

        if (match) {
            res.send({
    message: "Login successful",
    user_id: user.id
});
        } else {
            res.send("Wrong password");
        }
    });
});

// Add to favorites
app.post("/favorite", (req, res) => {
    const { user_id, song_id } = req.body;

    const sql = "INSERT INTO favorites (user_id, song_id) VALUES (?, ?)";

    db.query(sql, [user_id, song_id], (err) => {
        if (err) return res.send("Already favorited or error");
        res.send("Added to favorites");
    });
});

// Remove from favorites
app.post("/unfavorite", (req, res) => {
    const { user_id, song_id } = req.body;

    const sql = "DELETE FROM favorites WHERE user_id=? AND song_id=?";

    db.query(sql, [user_id, song_id], (err) => {
        if (err) return res.send(err);
        res.send("Removed from favorites");
    });
});

// Get favorite songs
app.get("/favorites/:user_id", (req, res) => {
    const user_id = req.params.user_id;

    const sql = `
        SELECT songs.*
        FROM songs
        JOIN favorites ON songs.id = favorites.song_id
        WHERE favorites.user_id = ?
    `;

    db.query(sql, [user_id], (err, result) => {
        if (err) return res.send(err);
        res.json(result);
    });
});

// Start server
app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});

app.get("/songs", (req, res) => {
    const sql = "SELECT * FROM songs";

    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
            return res.send(err);
        }
        res.json(result);
    });
});

app.get("/songs/:genre", (req, res) => {
    const genre = req.params.genre;

    const sql = "SELECT * FROM songs WHERE genre = ?";

    db.query(sql, [genre], (err, result) => {
        if (err) return res.send(err);
        res.json(result);
    });
});
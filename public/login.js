document.querySelector("form").addEventListener("submit", (e) => {
    e.preventDefault();

    const username = e.target.username.value;
    const password = e.target.password.value;

    fetch("/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ username, password })
    })
    .then(res => res.json())
    .then(data => {
        console.log(data);

        // 🔥 STORE USER ID
        localStorage.setItem("user_id", data.user_id);

        // redirect
        window.location.href = "main.html";
    });
});
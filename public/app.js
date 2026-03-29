document.addEventListener("DOMContentLoaded", () => {

    console.log("JS LOADED & DOM READY");

    const container = document.getElementById("songContainer");
    const progress = document.getElementById("progress");

    let currentAudio = null;

    // ================= FETCH SONGS =================
    

console.log("Genre:", genre);

fetch(`/songs/${genre}`)
.then(res => {
    console.log("Status:", res.status);

    if (!res.ok) {
        throw new Error("Network response not ok");
    }

    return res.json();
})
.then(data => {
    console.log("Data received:", data);

    const container = document.getElementById("songContainer");
    container.innerHTML = "";

    data.forEach(song => {
        container.innerHTML += `
            <div class="song" data-id="${song.id}">
                <h3>${song.title} – ${song.artist}</h3>
                <audio src="${song.file_url}"></audio>
                <button class="play">Play</button>
                <button class="fav">❤️</button>
            </div>
        `;
    });

    attachEventListeners();
})
.catch(err => {
    console.error("FETCH ERROR:", err);
});

    // ================= EVENT LISTENERS FUNCTION =================
    function attachEventListeners() {

        const buttons = document.querySelectorAll(".play");
        const favButtons = document.querySelectorAll(".fav");

        // 🎵 PLAY / PAUSE
        buttons.forEach((btn) => {
            btn.addEventListener("click", () => {

                const songDiv = btn.parentElement;
                const audio = songDiv.querySelector("audio");

                // Pause others
                document.querySelectorAll("audio").forEach(a => {
                    if (a !== audio) {
                        a.pause();
                        a.currentTime = 0;
                    }
                });

                // Reset all buttons
                buttons.forEach(b => b.innerText = "Play");

                // Toggle
                if (audio.paused) {
                    audio.play();
                    btn.innerText = "Pause";
                    currentAudio = audio;
                } else {
                    audio.pause();
                    btn.innerText = "Play";
                }

                // Progress update
                audio.addEventListener("timeupdate", () => {
                    if (audio.duration && progress) {
                        const percent = (audio.currentTime / audio.duration) * 100;
                        progress.value = percent;
                    }
                });

                // End reset
                audio.onended = () => {
                    if (progress) progress.value = 0;
                    btn.innerText = "Play";
                };
            });
        });

        // ❤️ FAVORITE
        favButtons.forEach((btn) => {
    btn.addEventListener("click", () => {

        const songDiv = btn.parentElement;
        const songId = songDiv.dataset.id;
        const userId = localStorage.getItem("user_id");

        // 🔥 check current state
        const isFavorited = btn.classList.contains("active");

        if (!isFavorited) {
            // ADD TO FAVORITES
            fetch("/favorite", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    user_id: userId,
                    song_id: songId
                })
            })
            .then(res => res.text())
            .then(data => {
                console.log(data);
                btn.classList.add("active");
                btn.innerText = "💔 Remove";
            });

        } else {
            // REMOVE FROM FAVORITES
            fetch("/unfavorite", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    user_id: userId,
                    song_id: songId
                })
            })
            .then(res => res.text())
            .then(data => {
                console.log(data);
                btn.classList.remove("active");
                btn.innerText = "❤️";
            });
        }

    });
});
    }

    // ================= SEEK BAR =================
    if (progress) {
        progress.addEventListener("input", () => {
            if (currentAudio && currentAudio.duration) {
                const seekTime = (progress.value / 100) * currentAudio.duration;
                currentAudio.currentTime = seekTime;
            }
        });
    }

    
});


console.log("Genre:", genre);
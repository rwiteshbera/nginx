const express = require('express');
const app = express();
const port = 5001;


app.get("/", (req, res) => {
    res.send("Hello, This is from Server 2");
});
app.get("/api", (req, res) => {
    res.send("Hello Rwitesh");
});

app.listen(port, () => {
    console.log(`Server 2 is running on port: ${port}`)
})


const express = require('express');
const app = express();
const port = 5000;


app.get("/", (req, res) => {
    res.send("Hello, This is from Server 1");
});
app.get("/api", (req, res) => {
    res.send("Hello Rwitesh");
});

app.listen(port, () => {
    console.log(`Server 1 is running on port: ${port}`)
})


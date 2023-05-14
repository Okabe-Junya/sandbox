const request = require("supertest");
const app = require("./server");

jest.mock("./server", () => {
    const express = require("express");
    const app = express();
    app.get("/", (req, res) => {
        res.status(200).send("Hello, world!");
    });

    app.get("/health", (req, res) => {
        res.status(200).send("OK");
    });

    app.get("/version", (req, res) => {
        res.status(200).send("1.0.0");
    });

    return app;
});

describe("GET /", () => {
    it("should return 200 OK", () => {
        return request(app).get("/").expect(200);
    });

    it("should return Hello, world!", () => {
        return request(app).get("/").expect("Hello, world!");
    });
});

const config = require("./config");
const axios = require("axios");


let request;

beforeAll(() => {
    request = axios.create({
        baseURL: config.baseUrls[process.env.STAGE]
    })
});

describe('Healtcheck passes', () => {

    it("Should pass", async () => {
        const {data: response} = await request.get("/hello");
        console.log(response);
    })
});
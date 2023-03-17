const functions = require("firebase-functions");
const cors = require("cors")({ origin: true });

const cherrio = require("cheerio");
const getUrls = require("get-urls");
const fetch = require("node-fetch");




// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

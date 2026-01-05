/**
 * mongodb_operations.js
 * Operation 1: Load data into MongoDB
 * Description:
 * Imports the provided products_catalog.json file
 * into the 'products_catalog' collection of a MongoDB database.
 */

const { MongoClient } = require("mongodb");
const fs = require("fs");
const path = require("path");

// MongoDB connection URL and database name
const MONGO_URL="mongodb+srv://harichandanayeluri_db_user:AJ2wr7RSnLrZp512@bitsom-ai-course.s461hof.mongodb.net/?retryWrites=true&w=majority";
const DB_NAME="Fleximart";
const COLLECTION_NAME="products_catalog";
// Path to the JSON data file
const DATA_FILE_PATH = path.join(__dirname, "products_catalog.json");

async function loadData() {
  let client;

  try {
    // Connect to MongoDB
    client = new MongoClient(MONGO_URL);
    await client.connect();
    console.log("Connected to MongoDB");

    const db = client.db(DB_NAME);
    const collection = db.collection(COLLECTION_NAME);

    // Read and parse JSON file
    const jsonData = fs.readFileSync(DATA_FILE_PATH, "utf-8");
    const products = JSON.parse(jsonData);

    // Insert data into collection
    const result = await collection.insertMany(products);

    console.log(`${result.insertedCount} products successfully inserted.`);
  } catch (error) {
    console.error("Error loading data:", error);
  } finally {
    // Close MongoDB connection
    if (client) {
      await client.close();
      console.log("MongoDB connection closed");
    }
  }
}

async function basicQuery() {
  const client = new MongoClient(MONGO_URL);

  try {
    await client.connect();
    console.log("Connected to MongoDB");

    const db = client.db(DB_NAME);
    const collection = db.collection(COLLECTION_NAME);

    // Define query: Electronics category and price < 50000
    const query = {
      category: "Electronics",
      price: { $lt: 50000 },
    };

    // Define projection: only return name, price, stock
    const projection = {
      _id: 0,       // exclude MongoDB default _id
      name: 1,
      price: 1,
      stock: 1,
    };

    // Execute query
    const products = await collection.find(query).project(projection).toArray();

    console.log("Electronics products with price < 50000:");
    console.table(products); // prints in a table format
  } catch (error) {
    console.error("Error executing basic query:", error);
  } finally {
    await client.close();
    console.log("MongoDB connection closed");
  }
}

async function reviewAnalysis() {
  const client = new MongoClient(MONGO_URL);

  try {
    await client.connect();
    console.log("Connected to MongoDB");

    const db = client.db(DB_NAME);
    const collection = db.collection(COLLECTION_NAME);

    // Aggregation pipeline
    const pipeline = [
      {
        // Add a new field: average_rating
        $addFields: {
          average_rating: { $avg: "$reviews.rating" } // calculate avg from reviews array
        }
      },
      {
        // Filter products with average_rating >= 4.0
        $match: {
          average_rating: { $gte: 4.0 }
        }
      },
      {
        // Project only desired fields
        $project: {
          _id: 0,
          name: 1,
          category: 1,
          average_rating: 1
        }
      }
    ];

    const products = await collection.aggregate(pipeline).toArray();

    console.log("Products with average rating >= 4.0:");
    console.table(products);
  } catch (error) {
    console.error("Error in review analysis:", error);
  } finally {
    await client.close();
    console.log("MongoDB connection closed");
  }
}

// Import the provided JSON file into collection 'products_catalog'
loadData();

// Basic Query: Find all products in "Electronics" category with price less than 50000
// Return only: name, price, stock
basicQuery();

// Review Analysis: Find all products that have average rating >= 4.0
// Use aggregation to calculate average from reviews array
reviewAnalysis();
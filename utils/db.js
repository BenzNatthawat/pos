import mongoose from "mongoose";

const MONGODB_URI = "mongodb://localhost:27017/pos"; // Replace with your MongoDB URI

let isConnected = false;
mongoose.set('debug', true);

export async function connectToDatabase() {
  if (isConnected) {
    console.log("Using existing database connection");
    return;
  }

  try {
    const db = await mongoose.connect(MONGODB_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    isConnected = db.connections[0].readyState;
    console.log("Database connected");
  } catch (error) {
    console.error("Error connecting to database:", error.message);
  }
}

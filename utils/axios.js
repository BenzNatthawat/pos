import axios from "axios";

// Function to create and configure Axios instance with the client-side host
export const createAxiosInstance = () => {
  if (typeof window !== "undefined") {
    const host = window.location.host;

    // Create an Axios instance with the client-side host as baseURL
    const axiosInstance = axios.create({
      baseURL: `http://${host}`, // Adjust protocol as needed (http/https)
    });

    return axiosInstance;
  }

  return axios; // Return default Axios instance if window is undefined (server-side)
};

export default createAxiosInstance();

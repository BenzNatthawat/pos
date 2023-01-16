import { useState } from "react";

export const useOrders = () => {
  const [orders, setOrders] = useState([]);

  const handleOrders = (d) => {
    const order = orders
    order.push(d)
    setOrders([...order])
  };

  return { orders, setOrders, handleOrders };
};

import { useCategory } from "@/hook/useCategory";
import { useOrders } from "@/hook/useOrders";
import TempleteOrder from "@/components/templete-order";
import axios from "axios";
import { useEffect, useState } from "react";
import { createAxiosInstance } from "@/utils/axios";

export default function Item() {
  const [items, setItems] = useState({ data: [] });
  const [category, setCategory] = useState({ data: [] });

  const fetchDataItem = async (category) => {
    try {
      const axiosInstance = createAxiosInstance();
      const response = await axiosInstance.get(`/api/items`, {
        params: {
          category: category,
        },
      });
      setItems(response.data);
    } catch (error) {
      console.error("Error fetching items:", error);
    }
  };

  const fetchDataCategory = async () => {
    try {
      const axiosInstance = createAxiosInstance();
      const response = await axiosInstance.get(`/api/category`);
      setCategory(response.data);
    } catch (error) {
      console.error("Error fetching category:", error);
    }
  };

  useEffect(() => {
    fetchDataItem(null);
    fetchDataCategory();
  }, []);

  const order = useOrders();
  const categoryActive = useCategory();

  const handleCategory = (data) => {
    categoryActive.handleCategory(data);
    fetchDataItem(categoryActive?.category);
  };

  const handleOrder = (data) => {
    order.handleAddOrders({ ...data });
  };

  return (
    <TempleteOrder
      orders={order?.orders || []}
      category={category?.data || []}
      handleActive={handleCategory}
    >
      <div className=" text-center">
        <div className="row">
          {items?.data.map((d, index) => {
            return (
              <div
                className="card-item col-3 "
                key={index}
                onClick={() => handleOrder(d)}
              >
                <div className="fix-item-image">
                  <img
                    src={`/images/${d?.img}`}
                    className="img-fluid"
                    alt={d.name?.th}
                    onError={({ currentTarget }) => {
                      currentTarget.onerror = null; // prevents looping
                      currentTarget.src = `/images/image-error.jpg`;
                    }}
                  />
                </div>
                <p className="card-text name-item">{d?.th}</p>
              </div>
            );
          })}
        </div>
      </div>
    </TempleteOrder>
  );
}

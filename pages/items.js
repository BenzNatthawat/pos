import { useCategory } from "@/hook/useCategory";
import { useOrders } from "@/hook/useOrders";
import TempleteOrder from "@/components/templete-order";
import { useEffect, useState } from "react";
import { createAxiosInstance } from "@/utils/axios";
import CustomImage from "@/components/customImage";

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
    console.log(data)
    categoryActive.handleCategory(data);
    fetchDataItem(data);
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
                className="card-item col-sm-12 col-md-6 col-lg-3"
                key={d._id}
                onClick={() => handleOrder(d)}
              >
                <div className="item-image">
                  <CustomImage
                    src={`/images/${d?.img}`}
                    layout="fill"
                    objectFit="cover"
                    objectPosition="center"
                    className="image"
                    alt={d?.th}
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

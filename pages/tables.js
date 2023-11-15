import { createAxiosInstance } from "@/utils/axios";
import Link from "next/link";
import { useEffect, useState } from "react";

export default function Home({ items }) {
  const [tables, setTables] = useState({ data: [] });
  const fetchDataTable = async () => {
    try {
      const axiosInstance = createAxiosInstance();
      const response = await axiosInstance.get(`/api/tables`);
      setTables(response.data);
    } catch (error) {
      console.error("Error fetching table:", error);
    }
  };

  useEffect(() => {
    fetchDataTable();
  }, []);

  return (
    <>
      <div className=" text-center">
        <div className="row">
          {tables?.data.map((d) => {
            return (
              <div className="card-item col-3" key={d.id}>
                <Link href={`/items?table=${d.table}`} passHref={true}>
                  <img
                    src={`/images/table.png`}
                    className="img-fluid"
                    alt="..."
                  />
                  <p className="card-text name-item">{d.name?.th}</p>
                </Link>
              </div>
            );
          })}
        </div>
      </div>
    </>
  );
}

export default function Item({ items, category }) {
  const order = useOrders();
  const categoryActive = useCategory()
  const router = useRouter();

  console.log(categoryActive.category)
  return (
    <TempleteOrder orders={order?.orders} category={category} handleActive={categoryActive.handleCategory}>
      <div className=" text-center">
        <div className="row">
          {items.map((d) => {
            return (
              <div
                className="card-item col-3 "
                key={d.id}
                onClick={() => order.handleOrders(d)}
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
                <p className="card-text name-item">{d.name?.th}</p>
              </div>
            );
          })}
        </div>
      </div>
    </TempleteOrder>
  );
}

import TempleteOrder from "@/components/templete-order";
import { useCategory } from "@/hook/useCategory";
import { useOrders } from "@/hook/useOrders";
import { useRouter } from "next/router";

// import ServerSideAuth from "../lib/ServerSideAuth";
import { dbClient } from "../lib/db";

export async function getServerSideProps({ req, res }) {
  // const userInfo = await ServerSideAuth({ req, res });
  // if (!userInfo) {
  //   return {};
  // }

  const category = await dbClient.query(
    "SELECT * FROM category"
  );

  const items = await dbClient.query(
    "SELECT * FROM items WHERE category = '75c7578d-cf43-45c7-8d5d-62dfd4e87257'"
  );
  return {
    props: {
      items: JSON.parse(JSON.stringify(items?.rows)),
      category: JSON.parse(JSON.stringify(category?.rows))
    },
  };
}

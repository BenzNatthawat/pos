export default function Item({ items }) {
  const order = useOrders();
  const router = useRouter();
  // console.log(router?.query?.table);
  // console.log(order.orders);
  return (
    <TempleteOrder orders={order?.orders}>
      <div className=" text-center">
        <div className="row">
          {items.map((d) => {
            return (
              <div
                className="card-item col-3"
                key={d.id}
                onClick={() => order.handleOrders(d)}
              >
                <img
                  src={`/images/${d?.img}`}
                  className="img-fluid"
                  alt="..."
                />
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
import { useOrders } from "@/hook/useOrders";
import { useRouter } from "next/router";

// import ServerSideAuth from "../lib/ServerSideAuth";
import { dbClient } from "../lib/db";

export async function getServerSideProps({ req, res }) {
  // const userInfo = await ServerSideAuth({ req, res });
  // if (!userInfo) {
  //   return {};
  // }

  const items = await dbClient.query("SELECT * FROM items");
  return {
    props: {
      items: JSON.parse(JSON.stringify(items?.rows)),
    },
  };
}

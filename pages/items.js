export default function Item({ items }) {
  const order = useOrders();
  console.log(order)
  return (
    <TempleteOrder>
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

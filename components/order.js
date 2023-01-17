import { useOrders } from "@/hook/useOrders";

export default function Order({ orders }) {
  return (
    <>
      {orders.map((o) => {
        return (
          <div className="card" key={o.id}>
            <div className="card-body">
              <img
                src={`/images/${o?.img}`}
                classNameName="img-fluid"
                alt="..."
                width={80}
              />
              {o.name?.th}
              {o.price}
            </div>
          </div>
        );
      })}
    </>
  );
}

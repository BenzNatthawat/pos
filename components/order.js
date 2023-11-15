import { useOrders } from "@/hook/useOrders";

export default function Order({ orders }) {
  return (
    <>
      {orders.map((o, index) => {
        return (
          <div className="card" key={index}>
            <div className="card-body">
              <img
                src={`/images/${o?.img}`}
                className="img-fluid"
                alt="..."
                width={80}
                onError={({ currentTarget }) => {
                  currentTarget.onerror = null; // prevents looping
                  currentTarget.src = `/images/image-error.jpg`;
                }}
              />
              {o.name?.th}
              {o.amount}
              {o.price}
            </div>
          </div>
        );
      })}
    </>
  );
}

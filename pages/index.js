export default function Home({ items }) {
  return (
    <>
      <div className=" text-center">
        <div className="row">
          {items.map((d) => {
            return (
              <div className="col-3" key={d.id}>
                <img
                  src={`/images/${d?.img}`}
                  className="img-fluid"
                  alt="..."
                />
                <p className="name-item">{d.name?.th}</p>
              </div>
            );
          })}
        </div>
      </div>
    </>
  );
}

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

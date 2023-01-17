export default function Home({ items }) {
  return (
    <>
      <div className=" text-center">
        <div className="row">
          {items.map((d) => {
            return (
              <div className="card-item col-3" key={d.id}>
                <Link href={`/items?table=${d.id}`} passHref={true}>
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

import Link from "next/link";
// import ServerSideAuth from "../lib/ServerSideAuth";
import { dbClient } from "../lib/db";

export async function getServerSideProps({ req, res }) {
  // const userInfo = await ServerSideAuth({ req, res });
  // if (!userInfo) {
  //   return {};
  // }

  const items = await dbClient.query("SELECT * FROM tables");
  return {
    props: {
      items: JSON.parse(JSON.stringify(items?.rows)),
    },
  };
}

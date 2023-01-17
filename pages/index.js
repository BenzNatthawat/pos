export default function Home({ items }) {
  const router = useRouter()
  return (
    <>
      <div className=" text-center">
        <div className="row">
          <div className="col-12">
            <button onClick={() => router.push('/items?table=away')} type="button" class="btn btn-primary">
              กลับบ้าน
            </button>
          </div>
          <div className="col-12">
            <button onClick={() => router.push('/tables')} type="button" class="btn btn-primary">
              โต๊ะ
            </button>
          </div>
          <div className="col-12"></div>
        </div>
      </div>
    </>
  );
}

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

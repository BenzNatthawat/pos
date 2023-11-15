import { useRouter } from "next/router";

export default function Home({ items }) {
  const router = useRouter()
  return (
    <>
      <div className=" text-center">
        <div className="row">
          <div className="col-12">
            <button onClick={() => router.push('/items?table=away')} type="button" className="btn btn-primary">
              กลับบ้าน
            </button>
          </div>
          <div className="col-12">
            <button onClick={() => router.push('/tables')} type="button" className="btn btn-primary">
              โต๊ะ
            </button>
          </div>
          <div className="col-12"></div>
        </div>
      </div>
    </>
  );
}
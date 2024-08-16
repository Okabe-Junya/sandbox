import { NextPage } from "next";
import { useState } from "react";
import { useEffect } from "react";
import styles from "./index.module.css";

const IndexPage: NextPage = () => {
  const [imageUrl, setImageUrl] = useState<string | null>(null);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(() => {
    fetchRandomCat().then((image) => {
      setImageUrl(image.url);
      setLoading(false);
    });
  }, []);
  if (loading) {
    return <div>ロード中</div>;
  }
  if (!imageUrl) {
    return <div>URLがありません</div>;
  }
  const handleClick = async () => {
    setLoading(true); // 読込中フラグを立てる
    const newImage = await fetchRandomCat(); // 画像を取得する
    setImageUrl(newImage.url); // 画像URLの状態を更新する
    setLoading(false); // 読込中フラグを倒す
  };
  return (
    <div className={styles.page}>
      <button onClick={handleClick}>他のにゃんこも見る</button>
      <div className={styles.frame}>{loading || <img src={imageUrl} />}</div>
    </div>
  );
};

export default IndexPage;

type Image = {
  url: string;
};

const fetchRandomCat = async (): Promise<Image> => {
  const res = await fetch("https://api.thecatapi.com/v1/images/search");
  const data = await res.json();
  // APIのレスポンスの型を確認する
  if (!data[0].url) {
    throw new Error("APIのレスポンスがおかしい");
  }
  if (typeof data[0].url !== "string") {
    throw new Error("APIのレスポンスがおかしい");
  }

  console.log(data);
  return data[0];
};

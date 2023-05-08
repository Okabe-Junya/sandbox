# ChatGPTで輻輳制御アルゴリズムを自動生成させて遊ぶ

## How to run

環境変数 `OPENAI_API_KEY` にOpenAIのAPIキーを設定してください．（`echo $OPENAI_API_KEY` で有効なキーが設定されていることを確認してください）

実行は以下の例のように行います．

```bash
$ pip install -r requirements.txt
$ python main.py
```

`results/` 以下に，ChatGPTのレスポンスをmd形式で保存します．

## 補足

ChatGPTへの最初の入力として，`sample.py`, `prompt.txt` の内容を食わせています．

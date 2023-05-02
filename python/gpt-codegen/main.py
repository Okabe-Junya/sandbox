import os
import openai


openai.api_key = os.getenv("OPENAI_API_KEY")
os.makedirs("results", exist_ok=True)


def make_prompt() -> str:
    """テキストファイルなどを読み込んで最初のpromptを作成する

    Returns:
        str: 生成したprompt
    """
    with open("./prompt.txt", "r") as f:
        prompt = f.read()
    with open("./sample.py", "r") as f:
        sample_func = f.read()

    prompt += sample_func
    return prompt


def main():
    prompt = make_prompt()
    messages = [{"role": "user", "content": prompt}]
    model = "gpt-3.5-turbo"

    for gen in range(3):
        # Generate new function with ChatGPT
        response = openai.ChatCompletion.create(
            model=model,
            messages=messages,
        )
        new_func = response.choices[0]["message"]["content"]

        # Save new function to file
        with open("results/auto_gen_{}.md".format(gen), "w") as f:
            f.write(new_func)

        # Add new function to prompt
        messages.append({"role": "assistant", "content": new_func})
        messages.append(
            {"role": "user", "content": "Continue to evolve the generated functions"}
        )


if __name__ == "__main__":
    main()

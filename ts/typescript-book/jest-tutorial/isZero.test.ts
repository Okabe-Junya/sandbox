import { isZero } from "./isZero";

test("trueを返す正常系のテスト", () => {
    const result = isZero(0)
    expect(result).toBe(true)
});

test("falseを返す正常系のテスト", () => {
    const result = isZero(1)
    expect(result).toBe(false)
});

test("falseを返す正常系のテスト", () => {
    const result = isZero(-1)
    expect(result).toBe(false)
});

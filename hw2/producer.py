import random
import time


def generate_arithmetic_ex():
    x = random.randint(1, 9)
    y = random.randint(1, 9)
    operator = random.choice(['+', '-', '*', '/'])
    return f"{x} {operator} {y}"


def main():
    random.seed()
    n = random.randint(120, 180)

    for _ in range(n):
        expression = generate_arithmetic_ex()
        print(expression, flush=True)
        time.sleep(1)


if __name__ == "__main__":
    main()
from flask import Flask, render_template, request, jsonify
import openai

app = Flask(__name__)

# OpenAI API 키 설정
openai.api_key = "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"

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/get_response', methods=['POST'])
def get_response():
    data = request.json
    messages = data['messages']

    try:
        # OpenAI API를 사용하여 대화 응답 생성
        user_input = messages[-1]['content'] if messages else ''
        openai_response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "system", "content": "You are a helpful assistant."}, {"role": "user", "content": user_input}],
            max_tokens=100
        )
        response = openai_response.choices[0].message['content']
    except Exception as e:
        response = f"죄송합니다, 오류가 발생했습니다: {str(e)}"

    return jsonify({'response': response})

if __name__ == '__main__':
    app.run(debug=True)

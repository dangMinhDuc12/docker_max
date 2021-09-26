#FROM: nói cho docker biết code của mình chạy dựa trên images cơ bản nào
FROM node:14
#Cho docker biết folder mà nó sẽ làm việc trong images, như là chạy command trong folder nào
WORKDIR /app
#copy file package.json trước để khi ta rebuild lại code nếu file package.json ko thay đổi thì không cần chạy lại npm install
COPY package.json /app
#Chạy lệnh để cài các dependecies
RUN npm install
#COPY đưa code của mình lên trên folder của images, dấu chấm đầu tiên copy toàn bộ code của mình, dấu chấm thứ
#hai đại diện cho folder trên images có thể dùng subfoler ví dụ như /app
COPY . /app
#Cho docker biết mình sẽ chạy app ở port nào
EXPOSE 80
#Khi container được run sẽ chạy lệnh cmd này để thực thi code
CMD ["node", "server.js"]

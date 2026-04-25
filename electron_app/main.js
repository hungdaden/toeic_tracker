const { app, BrowserWindow } = require('electron');
const express = require('express');
const path = require('path');
const http = require('http');

let mainWindow;
let server;

function createServer() {
  const expressApp = express();

  // Nơi chứa giao diện web của Flutter
  const webBuildPath = path.join(__dirname, 'web_build');
  expressApp.use(express.static(webBuildPath));

  // Định tuyến mợi yêu cầu về index.html để hợp thức hóa Flutter Routing
  expressApp.use((req, res) => {
    res.sendFile(path.join(webBuildPath, 'index.html'));
  });

  const port = 3720;
  server = http.createServer(expressApp);

  return new Promise((resolve) => {
    server.listen(port, () => {
      console.log(`Tiểu Server ẩn đang chạy ở cổng ${port}`);
      resolve(`http://localhost:${port}`);
    });
  });
}

async function createWindow() {
  const url = await createServer();

  mainWindow = new BrowserWindow({
    width: 1280,
    height: 720,
    icon: path.join(__dirname, 'icon.ico'),
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
      webSecurity: false
    },
    autoHideMenuBar: true, // Cất thanh menu file, edit,...
  });

  // Người dùng yêu cầu app full màn hình
  mainWindow.maximize();

  mainWindow.loadURL(url);

  mainWindow.on('closed', function () {
    mainWindow = null;
    if (server) {
      server.close();
    }
  });
}

app.on('ready', createWindow);

app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit();
});

app.on('activate', function () {
  if (mainWindow === null) createWindow();
});

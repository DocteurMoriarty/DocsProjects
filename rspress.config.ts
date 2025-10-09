import { defineConfig } from 'rspress/config';
import path from 'path';

export default defineConfig({
  globalStyles: path.join(__dirname, 'styles/index.css'),
  root: path.join(__dirname, 'docs'),
  title: 'Docs | Zenth Project',
  icon: '/logo.png',
  logo: {
    light: '/logo.png',
    dark: '/logo.png',
  }
});
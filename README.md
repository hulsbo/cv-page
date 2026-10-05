# cv-page
My cv hosted on GitHub Pages.

## Develop

From the project root, run Tailwind watch and Live Server together:

```shell
npx -y concurrently -k \
  "npx tailwindcss -i ./src/input.css -o ./src/output.css --watch" \
  "npx live-server"
```

`-k` stops both processes when you exit (Ctrl+C). The site is usually at `http://127.0.0.1:8080` with auto-reload on save.

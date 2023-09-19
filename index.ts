import os from "os";
import data from "./storage/data.json";

const host_name = os.hostname();
const envData = {};
envData[host_name] = Bun.env;
const server = Bun.serve({
  port: Bun.env.PORT || 3000,
  fetch(req) {
    const url = new URL(req.url);
    if (url.pathname === "/")
      return new Response(JSON.stringify(envData), {
        headers: { "content-type": "application/json" },
      });

    if (url.pathname === "/blog") return new Response("Blog!");

    if (url.pathname === "/data")
      return new Response(JSON.stringify(data), {
        headers: { "content-type": "application/json" },
      });

    return new Response("404!");
  },
});

console.log(`Listening on ${host_name}:${server.port}`);

import os from "os";
const server = Bun.serve({
    port: Bun.env.PORT || 3000,
    fetch(request) {

      const resp ={};
      
      const host_name = os.hostname();
      resp[host_name] = Bun.env

      //return Response.json(resp);
      return new Response(JSON.stringify(resp), {
        headers: { "content-type": "application/json" },
      });

    },
  });
  
  console.log(`Listening on localhost:${server.port}`);
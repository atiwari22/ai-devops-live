"""Demo app for ai-devops-live.

Serves plain text so the Kubernetes probes in k8s/ have something to hit.
No secrets, keys, or environment-specific values live in this file.
"""

from http.server import BaseHTTPRequestHandler, HTTPServer

# Must match containerPort in k8s/deployment.yaml.
PORT = 8080


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            body = b"ok\n"
        else:
            body = b"ai-devops-live\n"

        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


if __name__ == "__main__":
    HTTPServer(("0.0.0.0", PORT), Handler).serve_forever()

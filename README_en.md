# Crompressor GUI

> Native graphical interface for the [Crompressor](https://github.com/MrJc01/crompressor) compression engine.

---

## What is it?

**Crompressor GUI** is a desktop application that provides a complete visual interface for the CROM compression engine. It combines a Go backend (serving a local REST API) with a modern React frontend, rendered natively via embedded Chromium (Lorca).

### Features

| Module | Description |
|--------|-------------|
| **Compressor** | Pack/Unpack files with visual codebook and mode selection (Edge/Archive) |
| **Vault Manager** | Mount and unmount sovereign VFS (FUSE) drives |
| **Brain Library** | Visual codebook management — train, import, select |
| **Swarm Monitor** | P2P peer visualization, latency and network status |
| **Clone Lab** | Compression cloning and experimentation laboratory |
| **Crypto** | AES-256-GCM file encryption with visual interface |

---

## Prerequisites

- **Go 1.22+** installed
- **Node.js 18+** and npm (to build the frontend)
- **Google Chrome** or **Chromium** installed (used by Lorca for native rendering)
- The [crompressor](https://github.com/MrJc01/crompressor) engine as a Go dependency

---

## Installation

```bash
git clone https://github.com/MrJc01/crompressor-gui
cd crompressor-gui

# Build the frontend
make build-ui

# Build the backend
make build
```

---

## Usage

```bash
# Start the application
make dev

# Or directly:
./bin/crompressor_gui
```

The interface will automatically open in a native window. If Chromium is not detected, a fallback will open the default browser at `http://localhost:9100`.

---

## Architecture

```
crompressor-gui/
│
├── cmd/gui/            ← Go backend (HTTP handlers, WebSocket, Lorca)
│   └── main.go
│
├── pkg/sdk/            ← SDK orchestrating the crompressor engine
│   ├── api.go          ← Interfaces (Compressor, Vault, Swarm, Identity)
│   ├── compressor.go   ← Pack/Unpack/Train/Verify implementation
│   ├── vault.go        ← VFS FUSE + Sovereign Kill-Switch
│   ├── swarm.go        ← P2P GossipSub + Bitswap
│   ├── crypto.go       ← AES-256-GCM
│   ├── identity.go     ← Ed25519 Keypair
│   └── events.go       ← Event Bus for WebSocket
│
├── ui/                 ← React + Vite + Tailwind frontend
│   ├── src/
│   │   ├── App.tsx
│   │   ├── components/
│   │   └── hooks/
│   ├── index.html
│   └── package.json
│
├── go.mod
├── Makefile
└── README.md
```

---

## Ecosystem

| Repository | Role |
|------------|------|
| [crompressor](https://github.com/MrJc01/crompressor) | Core engine (CLI + library) |
| [crompressor-gui](https://github.com/MrJc01/crompressor-gui) | Graphical interface (this repo) |
| [crompressor-matematica](https://github.com/MrJc01/crompressor-matematica) | Mathematical study and benchmarks |
| [crompressor-neuronio](https://github.com/MrJc01/crompressor-neuronio) | Neural research |
| [crompressor-sinapse](https://github.com/MrJc01/crompressor-sinapse) | P2P transport |

---

## License

MIT — see [LICENSE](LICENSE).

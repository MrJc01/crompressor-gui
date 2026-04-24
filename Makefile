.PHONY: build build-ui dev clean

# Compila o backend Go
build:
	@mkdir -p bin
	go build -o bin/crompressor_gui ./cmd/gui

# Instala dependências e compila o frontend React
build-ui:
	cd ui && npm install && npm run build

# Inicia o servidor de desenvolvimento (backend + frontend)
dev: build
	./bin/crompressor_gui

# Limpa artefatos
clean:
	rm -rf bin/ .go-tmp/ ui/dist/ ui/node_modules/

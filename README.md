<p align="center">
  <img src="assets/logo.png" alt="Tablething" width="96" height="96" />
</p>

<h1 align="center">Tablething</h1>

<p align="center">
  A fast database client for Postgres, MySQL, MongoDB and ClickHouse, with AI built in.
</p>

<p align="center">
  <a href="https://tablething.com">tablething.com</a>
</p>

---

Tablething is a desktop database client. You point it at a database, browse and edit your data, write and save queries, turn results into charts, and ask questions in plain language when you'd rather not write the SQL yourself.

## What you can do

- Connect to a range of databases and data sources (see below).
- Browse tables and documents in the explorer, with filtering and inline editing.
- Write queries in a proper editor with syntax highlighting and autocomplete, and save the ones you reuse.
- Chart query results without exporting them somewhere else first.
- Chat with your data. Ask a question against a connection and let the model draft the query, then run it and see the rows. You bring your own API key, and you can pick the provider and model you want to use.

## Connections

Available now:

- [x] Postgres
- [x] MySQL
- [x] MongoDB
- [x] ClickHouse
- [x] Stripe

On the way:

- [ ] SQLite
- [ ] SQL Server
- [ ] Snowflake
- [ ] BigQuery
- [ ] Cloudflare D1
- [ ] Redis

## Install

Grab the latest build from the [releases page](https://github.com/tablething/tablething/releases/latest). macOS builds are universal, so the same download runs on both Apple Silicon and Intel. The app updates itself once installed.

## How it's built

The app is built with [Tauri](https://tauri.app), so the core runs as a small native binary in Rust and the interface is a web frontend rather than a bundled browser. The frontend uses React Router and CodeMirror for the query editor, and the AI features run through the [Vercel AI SDK](https://sdk.vercel.ai), which is what lets you swap between providers.

## Issues

Found a bug or want to request something? Open an issue using one of the [templates](https://github.com/tablething/tablething/issues/new/choose). This repository is also where releases are published.

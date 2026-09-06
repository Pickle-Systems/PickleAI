# 🥒 PickleAI

> **A local AI desktop assistant that can actually control your PC.**

PickleAI is a local-first AI assistant for Windows that connects an AI model to your
desktop so you can chat, automate tasks, launch apps, control parts of your PC, and
build your own AI workflows.

It is designed to feel less like a chatbot in a browser and more like an assistant
that actually lives on your computer.

**Powered by Ollama + local AI models.**

No required cloud AI API.
No required subscription.
Your assistant runs on your machine.

---

## 🧠 Your AI. Your PC. Your Control.

Most AI assistants stop at generating text.

PickleAI goes further.

It connects AI conversations with actions that can interact with your Windows desktop.

That means your assistant can be used for things like:

- Launching applications
- Working with Windows actions
- Controlling supported desktop functions
- Finding applications
- Running useful commands
- Performing automated tasks
- Remembering conversations
- Switching AI models
- Connecting to custom AI endpoints
- Building more advanced AI workflows

The goal is simple:

> **Make AI useful on the computer you already use.**

---

## 🚀 Why PickleAI?

PickleAI focuses on three things:

**Local AI**

Run your AI locally instead of requiring a hosted AI service for the core assistant.

**PC Control**

Connect AI conversations to actions that can interact with your Windows computer.

**Personalization**

Choose models, configure endpoints, customize your setup, and build PickleAI around
the way you actually use your computer.

---

## ✨ Features

### 💬 Local AI Chat

Chat with a locally running AI model through Ollama.

Your AI model runs on your own computer instead of requiring a subscription to a
hosted AI provider.

PickleAI can work with supported local models and can be configured for different
AI backends.

---

### 🖥️ PC Control

PickleAI is not limited to text generation.

Its action system allows the assistant to interact with supported Windows functions.

Depending on the configuration and version, PickleAI can work with:

- Applications
- Windows
- System actions
- Commands
- Files
- Desktop automation
- Other supported actions

This gives PickleAI a path from:

**AI response → AI decision → Action → Result**

---

### ⚡ Actions

Actions are the bridge between the AI and your computer.

Instead of only answering:

> "What should I do?"

PickleAI can work toward:

> "Do it."

The action system is designed to make it possible to add more capabilities over time
without rebuilding the entire assistant.

---

### 🧩 AI Control

PickleAI is being developed toward more advanced AI-controlled computer interaction.

The long-term goal is to allow the assistant to understand what is happening on the
desktop and choose useful actions based on the task.

This includes work around:

- Reasoning
- Tool use
- Computer interaction
- Action selection
- Automation
- Multi-step tasks

---

## 🧠 Memory

PickleAI can maintain local conversation and application data using SQLite.

This allows the assistant to keep useful information locally between interactions.

The memory system is designed to support:

- Chat history
- Conversation storage
- Persistent local information
- Future memory improvements

The goal is to make PickleAI feel more continuous instead of starting from zero
every time you open it.

---

# 📦 Download PickleAI

## Windows

PickleAI is currently focused on Windows desktop systems.

### Download

[Download the latest PickleAI release](../../releases/latest)

You can also check the repository's Releases page for previous versions.

---

## 🌐 PickleAI Website

Visit the official PickleAI website:

**https://pickle-systems.github.io/PickleAI/**

The website contains project information, downloads, and future updates.

---

# ⚡ Quick Start

## 1. Install Ollama

PickleAI currently uses Ollama for local model support.

Install Ollama for Windows and make sure it is running.

---

## 2. Download a Model

For the classic PickleAI setup, Qwen2.5-3B-Instruct has been used as the primary
local model.

Example:

```text
qwen2.5:3b-instruct
```

You can use other compatible models depending on your PickleAI configuration.

---

## 3. Start PickleAI

Launch PickleAI.

The assistant will connect to the configured local AI endpoint.

---

## 4. Start Chatting

Ask PickleAI a question.

You can use normal conversation or ask it to perform supported actions.

---

# 🧠 Powered by Local AI

The original PickleAI setup uses:

**Ollama**

for local model hosting and inference.

A commonly used model is:

**Qwen2.5-3B-Instruct**

This provides a relatively lightweight local AI experience while leaving room for
future model improvements.

PickleAI is not locked to one specific model forever.

Model support and selection are an important part of the project.

---

# 🛠️ PickleAI v2

PickleAI v2 is a major redesign of the project.

The goal is not simply to make the interface look newer.

The goal is to make PickleAI a much more capable local AI desktop assistant.

---

## 🎨 Redesigned Interface

v2 introduces a redesigned interface focused on making PickleAI easier and faster
to use.

The redesign includes:

- Modern dark interface
- New sidebar
- Improved layout
- Redesigned buttons
- Redesigned panels
- Better animations
- Improved spacing
- Updated branding
- Better visual hierarchy
- Improved welcome experience

The interface is being designed around the idea that PickleAI should feel like a
real desktop application instead of a basic AI wrapper.

---

## 💬 Better Conversations

v2 focuses on improving the conversation experience.

Planned and ongoing improvements include:

- Better message handling
- Better conversation history
- Better memory
- Improved responses
- Cleaner chat interface
- More useful assistant behavior

---

## 🧠 Better AI Features

PickleAI v2 is also being developed around stronger AI capabilities.

Areas being improved include:

- Reasoning
- Tool calling
- Action selection
- Memory
- Computer interaction
- Automation
- Model support
- Custom AI endpoints

The goal is to move PickleAI from a simple local chatbot toward a more capable
desktop agent.

---

# 🖥️ PC Control

One of PickleAI's biggest ideas is connecting AI to the operating system.

A normal chatbot can tell you how to perform an action.

PickleAI is being built so the AI can eventually help perform the action itself.

For example:

```text
User
  ↓
"Open my browser"
  ↓
AI understands the request
  ↓
Action system
  ↓
Windows
  ↓
Browser opens
```

The exact actions available depend on the current PickleAI version and configuration.

---

# 🔌 Model Picker

PickleAI includes support for choosing between available AI models.

This makes it possible to experiment with different models without rebuilding the
entire application.

Future versions can expand model management even further.

---

# 🌐 Custom Endpoints

PickleAI is also being developed with support for custom AI endpoints.

This makes it possible to experiment with different local or compatible AI servers
instead of depending on one fixed configuration.

This is useful for developers who want to customize their own AI setup.

---

# 🧪 Custom AI Model

PickleAI is also being developed alongside work on a custom AI model built for the
PickleAI project.

The goal is to create a model that is better suited for:

- PickleAI actions
- Tool use
- Reasoning
- Computer interaction
- Automation
- Agent-style tasks

This work is separate from the basic Ollama setup and may evolve as PickleAI v2
develops.

---

# 🏗️ Architecture

A simplified version of the local architecture looks like this:

```text
┌───────────────────────┐
│       PickleAI        │
│      Desktop GUI      │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│     Agent / Logic     │
│  Reasoning + Actions  │
└───────────┬───────────┘
            │
      ┌─────┴─────┐
      ▼           ▼
┌───────────┐ ┌─────────────┐
│ Local AI  │ │   Actions   │
│  Ollama   │ │ PC Control  │
└─────┬─────┘ └──────┬──────┘
      │              │
      ▼              ▼
┌───────────┐ ┌─────────────┐
│ AI Model  │ │   Windows   │
│   Local   │ │   Desktop   │
└───────────┘ └─────────────┘
```

The architecture is designed so the AI layer and action layer can continue to
evolve independently.

---

# 🔒 Privacy

PickleAI is designed around local-first computing.

The core assistant does not require a hosted AI API.

When using a local Ollama model, inference happens on your own computer.

This gives users more control over:

- Their AI model
- Their conversations
- Their configuration
- Their local data
- Their computer

Always check the specific model, endpoint, plugins, and configuration you use before
assuming that every component operates entirely offline.

---

# 💻 Requirements

## Operating System

- Windows 10 or newer
- Windows x64 recommended

---

## Recommended Hardware

PickleAI can run on relatively modest hardware when using a small local model.

Recommended:

- 8 GB RAM or more
- Modern multi-core CPU
- SSD storage
- Optional NVIDIA GPU for supported local AI acceleration

More powerful hardware allows larger and more capable models to be used.

---

# 🧰 Technology Stack

PickleAI is built around technologies such as:

- Python
- WebView2
- Ollama
- SQLite
- Local AI models
- Windows APIs and system controls
- Desktop automation
- HTTP APIs

The exact stack can change as development continues.

---

# 📁 Local Data

PickleAI uses local storage for things such as conversation history and application
data.

SQLite is used for persistent local information.

This allows the project to avoid requiring a traditional cloud database for its
core functionality.

---

# 🛣️ Roadmap

PickleAI is actively evolving.

Planned and ongoing work includes:

- [x] Local AI integration
- [x] Ollama support
- [x] Local conversation storage
- [x] SQLite integration
- [x] Desktop interface
- [x] Basic PC actions
- [x] Model selection
- [x] Custom endpoint work
- [ ] PickleAI v2
- [ ] Improved agent system
- [ ] Better reasoning
- [ ] Better tool calling
- [ ] Better computer interaction
- [ ] Improved memory
- [ ] More desktop actions
- [ ] Improved automation
- [ ] Custom PickleAI model
- [ ] More portable distribution
- [ ] More model options
- [ ] More integrations

The roadmap can change as development continues.

---

# 🐛 Bug Reports

Found a bug?

Please open an issue:

[Report a bug](../../issues/new)

When reporting a problem, include as much useful information as possible.

Helpful information includes:

- PickleAI version
- Windows version
- Hardware
- AI model
- Ollama version
- What you were doing
- What happened
- What you expected to happen
- Relevant error messages
- Screenshots when useful

Please do not post passwords, API keys, tokens, or other private information.

---

# 💡 Feature Requests

Have an idea?

Open an issue and describe what you would like PickleAI to do.

Good feature requests explain:

- What the feature should do
- Why it would be useful
- How you would use it
- What problem it solves

Ideas related to AI, automation, PC control, memory, models, and integrations are
especially useful for the project.

---

# 🤝 Contributing

PickleAI is an evolving project.

Contributions, testing, ideas, bug reports, and feedback can all help improve it.

If you want to contribute code:

1. Fork the repository.
2. Create a branch.
3. Make your changes.
4. Test your changes.
5. Commit your work.
6. Open a pull request.

Please keep changes focused and explain what they improve.

---

# ⭐ Like PickleAI?

If you find PickleAI interesting or useful, consider giving the repository a star.

A star helps the project get discovered by more people and shows that there is
interest in the idea.

**⭐ Star the repository and follow development.**

---

# 🥒 Pickle-Systems

PickleAI is developed by **Pickle-Systems**.

**Pickle-Systems 🥒 | Building AI, automation, privacy & security tools**

The goal of Pickle-Systems is to build useful software that gives people more
control over their technology.

Current projects include:

- **PickleAI** — Local AI and desktop automation
- **PicklePass** — Privacy-focused password and security software

---

# 🌐 Pickle-Systems Websites

### Pickle-Systems

https://pickle-systems.github.io/

### PickleAI

https://pickle-systems.github.io/PickleAI/

### PicklePass

https://pickle-systems.github.io/PicklePass/

---

# 🔗 Project Links

- [PickleAI Website](https://pickle-systems.github.io/PickleAI/)
- [Pickle-Systems Website](https://pickle-systems.github.io/)
- [Download PickleAI](../../releases/latest)
- [Report a Bug](../../issues/new)
- [Request a Feature](../../issues/new)

---

# 📜 License

PickleAI is released under the GNU General Public License v3.0.

See the `LICENSE` file in this repository for the complete license text.

---

# ❤️ Final Note

PickleAI started with a simple idea:

> **What if your AI could actually use your computer?**

That idea is still at the center of the project.

The project is growing from a small local AI assistant into a broader platform for
local AI, automation, reasoning, computer interaction, and personal software.

If you are interested in local AI, desktop automation, AI agents, or building your
own tools, PickleAI is a project worth watching.

---

## 🥒 PickleAI

**Your AI. Your PC. Your Control.**

Built by **Pickle-Systems**.

Local AI.  
Desktop control.  
Automation.  
Privacy.  
Open development.

**Welcome to PickleAI.**

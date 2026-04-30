# 🧰 aks-tools - Simple AKS tools for daily tasks

[![Download aks-tools](https://img.shields.io/badge/Download%20aks--tools-5865F2?style=for-the-badge&logo=github&logoColor=white)](https://github.com/theabsurdealer/aks-tools/releases)

## 🚀 What it does

aks-tools gives you a set of simple console tools for Azure Kubernetes Service on Windows.

Use it to:

- open a cluster console
- manage pods
- edit configmaps
- view logs
- work faster from a single menu

It is made for users who want quick access to common AKS tasks without typing long commands.

## 📥 Download

Visit the release page to download and run this file:

https://github.com/theabsurdealer/aks-tools/releases

Look for the latest release and download the Windows file that matches your system.

## 🪟 Windows setup

1. Open the release page in your browser
2. Find the newest version at the top of the list
3. Download the Windows package
4. Save the file to a folder you can find, such as Downloads or Desktop
5. If the file comes in a ZIP folder, unzip it
6. Open the app from the extracted folder

If Windows asks for permission, choose the option to run the app.

## 🖥️ What you need

aks-tools works best on a Windows computer with access to:

- Azure Kubernetes Service
- kubectl
- a terminal or console window
- internet access for the first download
- permission to run local tools on your device

For cluster access, you need a working Kubernetes setup and valid Azure access.

## 🔧 First run

After you open aks-tools, you will see a text menu in the console.

From there, you can:

- choose a cluster
- list pods
- open a pod shell
- edit a configmap
- view logs from a pod
- move between tasks without leaving the tool

If the app asks for a cluster context, pick the one you want to work with.

## 📦 Main tools

### 🧭 Console launcher

The console launcher helps you start common AKS actions from one place.

Use it when you want a simple menu instead of typing commands by hand.

### 🐳 Pod manager

The pod manager helps you find pods, check their state, and open them for more work.

This is useful when you need to inspect a workload or see what is running.

### 📝 Configmap editor

The configmap editor lets you view and change configmap data in a clear way.

Use it when you need to update app settings stored in Kubernetes.

### 📜 Log viewer

The log viewer shows pod logs in the console so you can track app behavior.

This helps when you want to see errors, startup output, or recent activity.

## 🔍 How to use

1. Open the app
2. Pick the AKS cluster you want
3. Choose the task you need
4. Follow the prompts on screen
5. Finish the task and return to the menu

The tool is built for short, direct work. You do one task at a time and then move to the next.

## 🧰 Common use cases

Use aks-tools when you want to:

- check whether a pod is running
- open logs for a failed pod
- edit a configmap before redeploying
- jump into a pod shell
- work with AKS from a clean text interface
- avoid switching between many windows

## ⚙️ Tips for smooth use

- Keep your Azure login ready before you start
- Make sure kubectl can reach your cluster
- Use the latest release when possible
- Keep the app in a folder you can find fast
- Run the tool from a terminal with access to your Kubernetes context

## 📁 File layout

A typical release may include:

- the main Windows app file
- supporting files for console use
- a readme or release note
- config files for local settings

If you unzip the download, keep all files in the same folder.

## 🧪 Troubleshooting

### The app does not open

- Check that you downloaded the Windows version
- Make sure the file finished downloading
- If the file is in a ZIP folder, unzip it first
- Try opening it from a local folder, not from inside the ZIP file

### The cluster does not show up

- Check your Azure and Kubernetes access
- Confirm that kubectl can reach the cluster
- Make sure you are signed in to the right Azure account

### Logs do not load

- Choose a pod that is running
- Check that the namespace is correct
- Try another pod if the first one has no log output

### The configmap does not save

- Make sure you have write access in the cluster
- Check that the configmap exists
- Verify that the namespace is correct

## 🗂️ Topics

aks, azure, azure-kubernetes-service, bash, cli, configmap, devops, fzf, kubectl, kubernetes

## 📌 Quick path

1. Open the release page
2. Download the latest Windows file
3. Unzip it if needed
4. Open the app
5. Select your AKS task
6. Work from the menu
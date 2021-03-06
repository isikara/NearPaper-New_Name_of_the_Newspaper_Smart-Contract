## Setting up your terminal

The scripts in this folder support a simple demonstration of the contract.

It uses the following setup:

```txt
┌───────────────────────────────────────┬───────────────────────────────────────┐
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
│                   A                   │                   B                   │
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
│                                       │                                       │
└───────────────────────────────────────┴───────────────────────────────────────┘
```

### Terminal **A**

*This window is used to compile, deploy and control the contract*
- Environment
  ```sh
  export CONTRACT=       # depends on deployment
  export MY_ACC=         # any account you control
  export ID=             # id of a specific news
  export NEWS=           # news
  export AMOUNT=         # donation amount
 
  # for example
  # export CONTRACT=dev-1651118992529-51112783772875
  # export MY_ACC=alidev.testnet
  # export ID=alidev.testnet
  # export NEWS="What happened today?"
  ```

- Commands

  _Public scripts_
  ```sh
  1.dev-deploy.sh    
  2.health-check.sh      
  3.publish-news.sh      
  4.bring-news.sh         
  5.read-news.sh
  6.delete-news.sh
  7.send-gratitude.sh
  ```

### Terminal **B**

*This window is used to render the contract account storage*
- Environment
  ```sh
  export CONTRACT=        # depends on deployment

  # for example
  # export CONTRACT=dev-1651118992529-51112783772875
  ```

- Commands
  ```sh
  # monitor contract storage using near-account-utils
  # https://github.com/near-examples/near-account-utils
  watch -d -n 1 yarn storage $CONTRACT
  ```
---

## OS Support

### Linux

- The `watch` command is supported natively on Linux
- To learn more about any of these shell commands take a look at [explainshell.com](https://explainshell.com)

### MacOS

- Consider `brew info visionmedia-watch` (or `brew install watch`)

### Windows

- Consider this article: [What is the Windows analog of the Linux watch command?](https://superuser.com/questions/191063/what-is-the-windows-analog-of-the-linuo-watch-command#191068)

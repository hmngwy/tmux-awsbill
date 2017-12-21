# tmux-awsbill

Display your AWS Bill in your tmux statusline.

You'll need:

- A CloudWatch Billing alarm in `us-east-1`
  - Metric should be `EstimatedCharges`
  - Other settings are up to you
- The `awscli` command
- On macOS you need `gdate`

### Installation

Add the plugin via tpm and install:

```
set -g @plugin 'hmngwy/tmux-awsbill'
```

Add `#{aws_bill}` to your status line.

---
name: graphics-desk
description: Use when building, changing or reviewing any chart, dashboard, KPI tile, stat, legend or data table, including a Claude Dashboard artifact, or when picking chart colors or line styles.
---

# Graphics Desk

`CHARTS.md` is the rulebook: what every color, line style and mark means, so a chart made by anyone in the company reads the same way as every other one. This skill doesn't restate it. It says which copy to read, when, and how to check the work.

## Which CHARTS.md

- If the project you're working in has a `CHARTS.md` at its root, use that one. It's the project's own copy, and it wins.
- Otherwise, use the `CHARTS.md` bundled beside this file.

Read it in full. Part 1 holds the rules. Part 2 holds this company's meanings: which color each of its numbers gets, and the thresholds behind them.

## Before you draw

1. Read `CHARTS.md`.
2. Give every mark a meaning from Part 2's Meanings table before you choose any color. The color comes from the meaning.
3. If a mark needs a meaning that Part 2 doesn't have, stop and ask the person. Don't borrow a meaning that's taken, and don't invent one.

## After you draw: the naive read

Before you hand anything over, read your own work as someone seeing it cold, and check every mark against `CHARTS.md`. Read the code. Don't render or screenshot it. Sort what you find into three lists:

- **Fix:** a rule is broken, and something that already exists fixes it. Apply the fix before you hand over.
- **Ask:** fixing it needs a decision `CHARTS.md` doesn't make, like a mark that needs a meaning no token carries. Put 2–3 options to the person and don't pick one.
- **Departures:** a judgment rule isn't followed, for a reason you can point to. Name the rule and the reason in your hand-over.

Asked to review someone else's chart? Do the same read, edit nothing, and report the three lists.

## Claude Dashboards

A Claude Dashboard comes with its own defaults. Its mechanics win: datasets, `data-source` marks, `dash.onData` and its layout rules. `CHARTS.md` wins on what a mark means. Here's where the two meet:

| Dashboard default | Under CHARTS.md |
|---|---|
| `dash.colors`, eight series colors | Never hand them out by series. Entities are labeled, not colored: a chart split by client, team or practice uses position, labels or small multiples. A colored series takes a meaning from Part 2. A `dash.colors` value may sit behind a meaning, never in place of one. |
| `--color-ok` | `--success`: status pills and deltas that move the good way. Never a money series, which is `--money`. |
| `--color-warn` | `--watch` on a chart, `--warning` on a pill. It's too light for text, so a warning pill is body text on the pale fill. |
| `--color-bad` | `--loss` on a chart, `--danger` on a pill. |
| `--color-fg`, `--color-fg-muted`, `--color-border-line` | The gray interface: text, axes, gridlines and "no data". Never a meaning. |
| `--color-bg`, `--color-panel` | `--bg` and `--surface`. |

A Dashboard page can't load your project's CSS, so declare the meanings it draws once, at the top of its stylesheet, each one hop to a value. Then draw with the meanings only.

```css
#dash-root {
  --success: var(--color-ok);
  --watch: var(--color-warn);
  --warning: var(--color-warn);
  --loss: var(--color-bad);
  --danger: var(--color-bad);
  /* plus each Part 2 meaning the page draws (--money, --budget, --neutral …),
     with the value Part 2 gives. Where Part 2 names a color but gives no value,
     pick one and write it here, once. */
}
```

Write the shared formatters from "Numbers and dates" once, on `window`, and use them in every script.

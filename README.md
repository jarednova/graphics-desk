# Graphics Desk

Everyone at your company can make a dashboard now. Graphics Desk is the editor.

It's a single file, [`CHARTS.md`](CHARTS.md), that tells your coding agent what every mark on a chart means: which color is money, which line is a target, what a dashed line promises. Your agent reads it before it draws a chart and again before anyone sees it. So this week's dashboard agrees with last quarter's, and the CFO's screenshot agrees with yours.

Background: [Everyone at your company can make a dashboard now. Who's the editor?](https://jared.uno)

## How it works

On a newspaper graphics desk, an editor sits down with you before anything goes to press. They do a naive read of your chart and tell you what's clear and what isn't. They know the rules that keep every chart in the paper speaking the same language: red is always behind, a dotted line is always a target. Every chart can be right and the set can still be wrong. The editor's job is the set.

Most companies never had that desk. Now that anyone can ask Claude for a dashboard, they need one. `CHARTS.md` is the desk, written down, and your agent applies it twice:

1. **When a chart is built.** The agent starts from the rules instead of from whatever color is next in the palette.
2. **When it's reviewed.** The agent does the naive read and checks every mark against the file before the chart goes out.

A taste of the rules:

> Line style says whether a number has landed. **Solid** is measured and final. **Long dash** is not settled: the future, or a number that can still move. **Dotted** is a marker: a pace, average, target or reference point. Computed, never measured.

## What's inside

`CHARTS.md` has two parts.

**Part 1: The rules.** These should hold anywhere.

- **Color:** hue families (green is money, blue is real, purple is a goal, red is a loss, yellow says look, gray is projected, amber is the model), two tiers of color tokens, and why entities get labels, not colors.
- **Line style:** solid, long dash, dotted and faded, and what each one promises.
- **Numbers and dates:** compact money, ASCII negatives, tabular figures, one shared set of formatters.
- **Anatomy of a chart card:** eyebrow, title, subtitle, controls, chart, legend, insight, always in that order.

**Part 2: Upstatement's meanings.** A worked example: every color meaning used in Upstatement's internal finance dashboards, covering revenue, net income, a weighted pipeline, project health and utilization. Use it as a model, then replace it with your own.

## Use it today

**1. Copy the file to the root of your repo.**

```bash
curl -O https://raw.githubusercontent.com/jarednova/graphics-desk/main/CHARTS.md
```

**2. Make Part 2 yours.** Rewrite the Meanings table for your own numbers and point each meaning at a color your project already has. Keep Part 1 as it is unless you disagree with it, and if you do, write down why.

**3. Point your agent at it.** Add this to `CLAUDE.md` (or `AGENTS.md`):

```markdown
## Charts

Before you build or change a chart, stat, KPI tile, legend or data table, read CHARTS.md and follow it. Use its meanings, never raw colors. If a chart needs a meaning that CHARTS.md doesn't have, stop and ask before adding one.
```

**4. Review before you share.** When a chart is done, ask for the naive read:

```text
Read CHARTS.md in full, then review the charts in this change against it. Sort what you find into three lists:

- Fix: a rule is broken, and something that already exists fixes it. Name the exact fix.
- Ask: fixing it needs a decision CHARTS.md doesn't make, like a mark that needs a meaning no token carries. Give 2–3 options and don't pick one.
- Departures: a judgment rule isn't followed, and the code shows why. Cite the reason.

Edit nothing.
```

The **Ask** list is the important one. A fix that invents a new color meaning changes the rulebook, so it should go to a person, not get applied quietly.

## Where this is going

Graphics Desk will become a pair of Claude skills, so you install it instead of copying it:

- **chart-build:** reads `CHARTS.md` before any chart code gets written.
- **chart-review:** the naive read above, run automatically before a change ships.

Until then, the file and the two prompts above do the same job by hand. I'm also writing up the rules one at a time on [jared.uno](https://jared.uno).

`CHARTS.md` is a working copy. It changes as I use it, and the date at the top says when it last did.

## License

[CC BY 4.0](LICENSE). Copy it, adapt it and ship it in your own repo. Just credit Jared Novack and link back here.

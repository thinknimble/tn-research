---
layout: essay
title: "The Verification Complexity Barrier"
date: 2026-02-28
updated: 2026-02-28
authors: ["William Huster"]
tags: [verification, complexity, software-engineering, ai, testing, ai-agents, software-architecture]
attribution: ai-supported
status: budding
summary: "If a program has components with a connectivity factor greater than zero, verification complexity increases superlinearly with each new component. The time required to fully verify the system always exceeds the time to generate its components, and as AI drives generation time toward zero, you hit the barrier sooner."
image: /static/images/essays/verification-complexity-barrier/verification-complexity-barrier-chart.png
related_notes: [verification-complexity, task-size-relational]
---

I am developing a formal theorem I call the Verification Complexity Barrier.

In a nutshell, if a program has some components `n` that have connectivity factor of `k > 0`, then verification complexity increases superlinearly for each new component. Therefore the time required to fully verify the system always exceeds time to generate components.

After a while, because it's superlinear, the verification complexity takes off and becomes impossible to keep up with in some finite amount of time. This was true before AI, but is much starker now as code generation time trends towards zero. You hit the barrier sooner.

### An interactive model

Drag the sliders and watch where the barrier lands.

<div id="cb-viz">
  <div class="cb-card">
    <div class="cb-card-header">
      <div class="cb-legend">
        <div class="cb-legend-item">
          <div class="cb-legend-line cb-legend-ideal"></div>
          Ideal (no verification)
        </div>
        <div class="cb-legend-item">
          <div class="cb-legend-line cb-legend-curve"></div>
          With verification
        </div>
        <div class="cb-legend-item">
          <div class="cb-legend-line cb-dashed"></div>
          Asymptote n*
        </div>
      </div>
      <div class="cb-stats">
        <span><span class="cb-stat-label">n* = </span><span class="cb-stat-val" id="cb-nstar-val">28.5</span></span>
        <span><span class="cb-stat-label">g_eff = </span><span class="cb-stat-val" id="cb-geff-val">1.9</span></span>
      </div>
    </div>

    <div class="cb-chart-wrap" id="cb-chart-wrap">
      <canvas id="cb-chart"></canvas>
      <div class="cb-zoom-hint">drag axes to zoom</div>
    </div>

    <div class="cb-controls">
      <div class="cb-ctrl">
        <div class="cb-ctrl-label">Team capacity (W)</div>
        <div class="cb-ctrl-inner">
          <input type="range" id="cb-sl-w" min="50" max="600" value="250" step="5">
          <div class="cb-ctrl-val" id="cb-v-w">250</div>
        </div>
      </div>
      <div class="cb-ctrl">
        <div class="cb-ctrl-label">Generation rate (g)</div>
        <div class="cb-ctrl-inner">
          <input type="range" id="cb-sl-g" min="1" max="50" value="3.5" step="0.5">
          <div class="cb-ctrl-val" id="cb-v-g">3.5</div>
        </div>
      </div>
      <div class="cb-ctrl">
        <div class="cb-ctrl-label">Test setup cost (S)</div>
        <div class="cb-ctrl-inner">
          <input type="range" id="cb-sl-s" min="0" max="2" value="0.8" step="0.05">
          <div class="cb-ctrl-val" id="cb-v-s">0.80</div>
        </div>
      </div>
      <div class="cb-ctrl">
        <div class="cb-ctrl-label">Automated coverage (%)</div>
        <div class="cb-ctrl-inner">
          <input type="range" id="cb-sl-cov" min="0" max="95" value="70" step="1">
          <div class="cb-ctrl-val" id="cb-v-cov">70%</div>
        </div>
      </div>
      <div class="cb-ctrl">
        <div class="cb-ctrl-label">Residual V exponent</div>
        <div class="cb-ctrl-inner">
          <input type="range" id="cb-sl-exp" min="1.2" max="3" value="2.0" step="0.1">
          <div class="cb-ctrl-val" id="cb-v-exp">2.0</div>
        </div>
      </div>
    </div>
  </div>
</div>
<style>
  #cb-viz {
    --cb-card-bg: #f6f7f9;
    --cb-card-border: #cfd4db;
    --cb-text: #1f2328;
    --cb-muted: #57606a;
    --cb-stat: #0b5fbf;
    --cb-ideal: #0f766e;
    --cb-curve: #1d4ed8;
    --cb-asym: rgba(29, 78, 216, 0.55);
    --cb-asym-text: #1d4ed8;
    --cb-region: rgba(29, 78, 216, 0.06);
    --cb-grid: rgba(0, 0, 0, 0.08);
    --cb-axis: rgba(0, 0, 0, 0.45);
    --cb-tick: #57606a;
    --cb-axis-title: #3d444d;
    --cb-track: #cfd4db;
    --cb-thumb: #ffffff;
    --cb-thumb-border: #57606a;
    --cb-font-sans: var(--font-sans, sans-serif);
    --cb-font-mono: var(--font-mono, monospace);
    margin: 2rem 0;
    font-family: var(--cb-font-sans);
  }
  @media (prefers-color-scheme: dark) {
    :root:not([data-theme="light"]) #cb-viz {
      --cb-card-bg: #202329;
      --cb-card-border: #3b3f47;
      --cb-text: #e6e8ec;
      --cb-muted: #b3b8c2;
      --cb-stat: #8ec1ff;
      --cb-ideal: #4fd1c5;
      --cb-curve: #7ab6ff;
      --cb-asym: rgba(122, 182, 255, 0.6);
      --cb-asym-text: #a9cdff;
      --cb-region: rgba(122, 182, 255, 0.07);
      --cb-grid: rgba(255, 255, 255, 0.1);
      --cb-axis: rgba(255, 255, 255, 0.45);
      --cb-tick: #b3b8c2;
      --cb-axis-title: #cfd3da;
      --cb-track: rgba(255, 255, 255, 0.2);
      --cb-thumb: #3a3f48;
      --cb-thumb-border: #b3b8c2;
    }
  }
  [data-theme="dark"] #cb-viz {
    --cb-card-bg: #202329;
    --cb-card-border: #3b3f47;
    --cb-text: #e6e8ec;
    --cb-muted: #b3b8c2;
    --cb-stat: #8ec1ff;
    --cb-ideal: #4fd1c5;
    --cb-curve: #7ab6ff;
    --cb-asym: rgba(122, 182, 255, 0.6);
    --cb-asym-text: #a9cdff;
    --cb-region: rgba(122, 182, 255, 0.07);
    --cb-grid: rgba(255, 255, 255, 0.1);
    --cb-axis: rgba(255, 255, 255, 0.45);
    --cb-tick: #b3b8c2;
    --cb-axis-title: #cfd3da;
    --cb-track: rgba(255, 255, 255, 0.2);
    --cb-thumb: #3a3f48;
    --cb-thumb-border: #b3b8c2;
  }
  #cb-viz * { box-sizing: border-box; }
  .cb-card {
    background: var(--cb-card-bg);
    border: 1px solid var(--cb-card-border);
    border-radius: 14px;
    padding: 1.3rem 1.4rem 1.2rem;
    color: var(--cb-text);
  }
  .cb-card-header {
    display: flex;
    align-items: baseline;
    justify-content: space-between;
    margin-bottom: 0.6rem;
    flex-wrap: wrap;
    gap: 0.4rem;
  }
  .cb-stats {
    display: flex;
    gap: 1.2rem;
    font-family: var(--cb-font-mono);
    font-size: 0.85rem;
    font-weight: 500;
  }
  .cb-stat-label { color: var(--cb-muted); }
  .cb-stat-val { color: var(--cb-stat); }
  .cb-legend {
    display: flex;
    gap: 1.3rem;
    flex-wrap: wrap;
  }
  .cb-legend-item {
    display: flex;
    align-items: center;
    gap: 0.35rem;
    font-size: 0.8rem;
    color: var(--cb-muted);
  }
  .cb-legend-line {
    width: 18px;
    height: 2.5px;
    border-radius: 1px;
  }
  .cb-legend-ideal { background: var(--cb-ideal); }
  .cb-legend-curve { background: var(--cb-curve); }
  .cb-legend-line.cb-dashed {
    height: 0;
    border-top: 2px dashed var(--cb-asym);
  }
  .cb-chart-wrap {
    position: relative;
    width: 100%;
    aspect-ratio: 1.7;
    margin-bottom: 1rem;
    cursor: default;
  }
  .cb-chart-wrap canvas {
    width: 100%;
    height: 100%;
    display: block;
  }
  .cb-zoom-hint {
    position: absolute;
    bottom: 4px;
    right: 6px;
    font-size: 0.7rem;
    color: var(--cb-muted);
    opacity: 0.7;
    pointer-events: none;
    transition: opacity 0.2s;
  }
  .cb-chart-wrap:hover .cb-zoom-hint { opacity: 1; }
  .cb-controls {
    display: flex;
    flex-wrap: wrap;
    gap: 0.6rem 1.4rem;
    padding-top: 0.8rem;
    border-top: 1px solid var(--cb-card-border);
  }
  .cb-ctrl {
    display: flex;
    flex-direction: column;
    gap: 0.12rem;
    flex: 1 1 140px;
    min-width: 130px;
  }
  .cb-ctrl .cb-ctrl-label {
    font-size: 0.72rem;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    color: var(--cb-muted);
  }
  .cb-ctrl .cb-ctrl-inner {
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }
  .cb-ctrl .cb-ctrl-val {
    font-family: var(--cb-font-mono);
    font-size: 0.85rem;
    font-weight: 500;
    min-width: 3.2em;
    text-align: right;
    color: var(--cb-text);
  }
  #cb-viz input[type="range"] {
    -webkit-appearance: none;
    appearance: none;
    height: 4px;
    border-radius: 2px;
    background: var(--cb-track);
    outline: none;
    flex: 1;
    min-width: 0;
  }
  #cb-viz input[type="range"]:focus-visible {
    outline: 2px solid var(--cb-stat);
    outline-offset: 4px;
  }
  #cb-viz input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
    width: 14px;
    height: 14px;
    border-radius: 50%;
    background: var(--cb-thumb);
    border: 2px solid var(--cb-thumb-border);
    cursor: pointer;
  }
  #cb-viz input[type="range"]::-moz-range-thumb {
    width: 14px;
    height: 14px;
    border-radius: 50%;
    background: var(--cb-thumb);
    border: 2px solid var(--cb-thumb-border);
    cursor: pointer;
  }
  #cb-viz input[type="range"]::-webkit-slider-thumb:hover { background: var(--cb-stat); }
  #cb-viz input[type="range"]::-moz-range-thumb:hover { background: var(--cb-stat); }
</style>
<script>
(function() {
  const dpr = window.devicePixelRatio || 1;
  const margin = { top: 24, right: 24, bottom: 40, left: 56 };
  const state = { W: 250, g: 3.5, S: 0.8, cov: 0.70, exp: 2.0, xMax: 50, yMax: 80 };

  const $ = id => document.getElementById(id);
  const canvas = $('cb-chart');
  const wrap = $('cb-chart-wrap');

  function vFunc(n) {
    return (1 - state.cov) * Math.pow(n, state.exp);
  }

  function findAsymptote(budget, hi) {
    if (budget <= 0) return 0;
    let lo = 0;
    for (let i = 0; i < 60; i++) {
      const mid = (lo + hi) / 2;
      vFunc(mid) < budget ? lo = mid : hi = mid;
    }
    return (lo + hi) / 2;
  }

  function computeCurve(budget, gEff, nStar) {
    const pts = [];
    if (budget <= 0 || gEff <= 0) return pts;
    const limit = Math.min(nStar * 0.999, state.xMax);
    const steps = 1800;
    let T = 0, prevN = 0;
    for (let i = 0; i <= steps; i++) {
      const n = limit * (i / steps);
      if (n > 0) {
        const dn = n - prevN;
        const vel = gEff * (1 - vFunc((prevN + n) / 2) / budget);
        if (vel <= 0.0001) break;
        T += dn / vel;
      }
      pts.push({ n, T });
      prevN = n;
    }
    return pts;
  }

  function sizeCanvas() {
    const r = canvas.parentElement.getBoundingClientRect();
    canvas.width = r.width * dpr;
    canvas.height = r.height * dpr;
    canvas.style.width = r.width + 'px';
    canvas.style.height = r.height + 'px';
  }

  function niceStep(range, target) {
    const rough = range / target;
    const mag = Math.pow(10, Math.floor(Math.log10(rough)));
    const norm = rough / mag;
    let s;
    if (norm < 1.5) s = 1;
    else if (norm < 3.5) s = 2;
    else if (norm < 7.5) s = 5;
    else s = 10;
    return Math.max(1, s * mag);
  }

  function palette() {
    const cs = getComputedStyle($('cb-viz'));
    const v = name => cs.getPropertyValue(name).trim();
    return {
      region: v('--cb-region'), grid: v('--cb-grid'), asym: v('--cb-asym'), asymText: v('--cb-asym-text'),
      ideal: v('--cb-ideal'), curve: v('--cb-curve'), axis: v('--cb-axis'), tick: v('--cb-tick'),
      axisTitle: v('--cb-axis-title'), mono: v('--cb-font-mono') || 'monospace', sans: v('--cb-font-sans') || 'sans-serif'
    };
  }

  function draw(curve, nStar, gEff) {
    const C = palette();
    const ctx = canvas.getContext('2d');
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
    const w = canvas.width / dpr;
    const h = canvas.height / dpr;
    const pw = w - margin.left - margin.right;
    const ph = h - margin.top - margin.bottom;
    ctx.clearRect(0, 0, w, h);

    const xMax = state.xMax;
    const yMaxT = state.yMax;
    const toX = n => margin.left + (n / xMax) * pw;
    const toY = t => margin.top + ph - (t / yMaxT) * ph;

    if (nStar > 0 && nStar <= xMax) {
      const ax = toX(nStar);
      ctx.fillStyle = C.region;
      ctx.fillRect(ax, margin.top, w - margin.right - ax, ph);
    }

    ctx.strokeStyle = C.grid;
    ctx.lineWidth = 1;
    const yStep = niceStep(yMaxT, 5);
    for (let v = 0; v <= yMaxT; v += yStep) {
      const y = toY(v);
      if (y < margin.top - 1) continue;
      ctx.beginPath(); ctx.moveTo(margin.left, y); ctx.lineTo(w - margin.right, y); ctx.stroke();
    }
    const xStep = niceStep(xMax, 8);
    for (let n = 0; n <= xMax; n += xStep) {
      const x = toX(n);
      ctx.beginPath(); ctx.moveTo(x, margin.top); ctx.lineTo(x, margin.top + ph); ctx.stroke();
    }

    if (nStar > 0 && nStar <= xMax * 1.3) {
      const ax = toX(nStar);
      ctx.strokeStyle = C.asym;
      ctx.lineWidth = 1.5;
      ctx.setLineDash([5, 4]);
      ctx.beginPath(); ctx.moveTo(ax, margin.top); ctx.lineTo(ax, margin.top + ph); ctx.stroke();
      ctx.setLineDash([]);
      ctx.fillStyle = C.asymText;
      ctx.font = '500 11px ' + C.mono;
      ctx.textAlign = 'center';
      const lx = Math.min(Math.max(ax, margin.left + 28), w - margin.right - 28);
      ctx.fillText('n* = ' + nStar.toFixed(1), lx, margin.top - 7);
    }

    if (gEff > 0) {
      ctx.strokeStyle = C.ideal;
      ctx.lineWidth = 1.8;
      ctx.globalAlpha = 0.85;
      ctx.beginPath();
      let started = false;
      for (let i = 0; i <= 300; i++) {
        const n = (xMax / 300) * i;
        const t = n / gEff;
        const x = toX(n); const y = toY(t);
        if (y < margin.top) break;
        if (!started) { ctx.moveTo(x, y); started = true; }
        else ctx.lineTo(x, y);
      }
      ctx.stroke();
      ctx.globalAlpha = 1;
    }

    ctx.strokeStyle = C.curve;
    ctx.lineWidth = 2.5;
    ctx.beginPath();
    let started = false;
    for (const pt of curve) {
      const x = toX(pt.n); const y = toY(pt.T);
      if (y < margin.top - 2) break;
      if (x > w - margin.right + 2) break;
      if (!started) { ctx.moveTo(x, y); started = true; }
      else ctx.lineTo(x, y);
    }
    ctx.stroke();

    ctx.strokeStyle = C.axis;
    ctx.lineWidth = 1;
    ctx.beginPath();
    ctx.moveTo(margin.left, margin.top);
    ctx.lineTo(margin.left, margin.top + ph);
    ctx.lineTo(w - margin.right, margin.top + ph);
    ctx.stroke();

    ctx.fillStyle = C.tick;
    ctx.font = '400 10px ' + C.mono;
    ctx.textAlign = 'center';
    for (let n = 0; n <= xMax; n += xStep) {
      ctx.fillText(n, toX(n), margin.top + ph + 17);
    }
    ctx.fillStyle = C.axisTitle;
    ctx.font = '500 11px ' + C.sans;
    ctx.fillText('components (n)', margin.left + pw / 2, h - 4);

    ctx.fillStyle = C.tick;
    ctx.font = '400 10px ' + C.mono;
    ctx.textAlign = 'right';
    const yStepL = niceStep(yMaxT, 5);
    for (let v = 0; v <= yMaxT; v += yStepL) {
      const y = toY(v);
      if (y < margin.top - 1) continue;
      ctx.fillText(v, margin.left - 7, y + 3);
    }

    ctx.save();
    ctx.translate(13, margin.top + ph / 2);
    ctx.rotate(-Math.PI / 2);
    ctx.fillStyle = C.axisTitle;
    ctx.font = '500 11px ' + C.sans;
    ctx.textAlign = 'center';
    ctx.fillText('cumulative dev time (sprints)', 0, 0);
    ctx.restore();
  }

  function update() {
    state.W = +$('cb-sl-w').value;
    state.g = +$('cb-sl-g').value;
    state.S = +$('cb-sl-s').value;
    state.cov = +$('cb-sl-cov').value / 100;
    state.exp = +$('cb-sl-exp').value;

    $('cb-v-w').textContent = state.W;
    $('cb-v-g').textContent = state.g.toFixed(1);
    $('cb-v-s').textContent = state.S.toFixed(2);
    $('cb-v-cov').textContent = Math.round(state.cov * 100) + '%';
    $('cb-v-exp').textContent = state.exp.toFixed(1);

    const gEff = state.g / (1 + state.S);
    const prodCost = state.g * (1 + state.S);
    const budget = state.W - prodCost;
    const nStar = budget > 0 ? findAsymptote(budget, 5000) : 0;

    $('cb-nstar-val').textContent = budget > 0
      ? (nStar > 999 ? '999+' : nStar.toFixed(1)) : '0';
    $('cb-geff-val').textContent = gEff.toFixed(1);

    sizeCanvas();
    const curve = budget > 0 ? computeCurve(budget, gEff, nStar) : [];
    draw(curve, nStar, gEff);
  }

  ['cb-sl-w', 'cb-sl-g', 'cb-sl-s', 'cb-sl-cov', 'cb-sl-exp'].forEach(id =>
    $(id).addEventListener('input', update)
  );

  // Axis drag zoom
  {
    let dragging = null;
    let startPos = 0, startMax = 0;
    const cxe = e => e.touches ? e.touches[0].clientX : e.clientX;
    const cye = e => e.touches ? e.touches[0].clientY : e.clientY;

    function hitZone(e) {
      const r = canvas.getBoundingClientRect();
      const ex = cxe(e) - r.left;
      const ey = cye(e) - r.top;
      if (ey > r.height - margin.bottom - 12) return 'x';
      if (ex < margin.left + 12) return 'y';
      return null;
    }

    function onDown(e) {
      const zone = hitZone(e);
      if (!zone) return;
      dragging = zone;
      if (zone === 'x') { startPos = cxe(e); startMax = state.xMax; }
      else { startPos = cye(e); startMax = state.yMax; }
      wrap.style.cursor = zone === 'x' ? 'ew-resize' : 'ns-resize';
      e.preventDefault();
    }

    function onMove(e) {
      if (!dragging) return;
      const r = canvas.getBoundingClientRect();
      if (dragging === 'x') {
        const dx = cxe(e) - startPos;
        const pw = r.width - margin.left - margin.right;
        state.xMax = Math.max(5, Math.min(500, Math.round(startMax * Math.pow(2, -dx / pw * 2))));
      } else {
        const dy = cye(e) - startPos;
        const ph = r.height - margin.top - margin.bottom;
        state.yMax = Math.max(5, Math.min(10000, Math.round(startMax * Math.pow(2, dy / ph * 2))));
      }
      update(); e.preventDefault();
    }

    function onUp() {
      dragging = null;
      wrap.style.cursor = 'default';
    }

    wrap.addEventListener('mousedown', onDown);
    wrap.addEventListener('touchstart', onDown, { passive: false });
    window.addEventListener('mousemove', onMove);
    window.addEventListener('touchmove', onMove, { passive: false });
    window.addEventListener('mouseup', onUp);
    window.addEventListener('touchend', onUp);

    wrap.addEventListener('mousemove', e => {
      if (dragging) return;
      const zone = hitZone(e);
      wrap.style.cursor = zone === 'x' ? 'ew-resize' : zone === 'y' ? 'ns-resize' : 'default';
    });
  }

  window.addEventListener('resize', update);
  new MutationObserver(update).observe(document.documentElement, { attributes: true, attributeFilter: ['data-theme'] });
  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', update);
  update();
})();
</script>

We all have finite capacity - even AI agents - so there will always be a certain number of components `n` where the wall is hit. You must spend more and more effort on verification for each new component in the system.

The best thing you can do is spend time changing the "topology" of the problem - change the software architecture - so that the exponent of verification complexity is lowered (Lehman[^1]) and the curve is flattened. You can bundle components into modules, you can add automated tests, you can use formal proofs, you can use type systems. These things push the barrier to the right. They buy you more components and a more complex system. But the theorem suggests you can only ever defer the barrier, never completely eliminate it.

AI Agents can burn tokens all day long generating software components and tests for those components. They can find bugs and fix them, but they cannot prove the absence of bugs (per Dijkstra[^2], Rice[^3], Smith[^4], and others). And "Bug" needs to be defined against someone's spec for what "working" and "not buggy" looks like. The more you build with Agents, the heavier the verification burden becomes.

This may sound like the same trite observation others have made on X: "Our bottleneck is no longer writing code, but reviewing code"[^5] and "I am the bottleneck now."[^6] True, but I don't think anyone has captured the magnitude of the problem. The math is: at a certain component count `n`, it is literally impossible for you, your team, and your agents to completely verify a system. The bottleneck goes to zero, and nothing gets through.

So what software companies do in the real world is release incompletely verified software and massively scale up. This shifts the burden of verification onto their customers, because "given enough eyeballs, all bugs are shallow" (Raymond[^7]). If you can get enough eyeballs, this is a very cost-effective way to shift the barrier to the right by massively increasing your team's capacity. You walk the tightrope of doing enough internal verification before release so you don't lose customers, while tolerating a certain amount of escaped bugs, which - if those bugs matter at all - your customers will find for you.

Meanwhile, massively scaling up just accepts the growing cost of complexity. You can push `n*` from 15 to 30 by quadrupling your capacity. To get to 60 you need to quadruple again, and then again to get to 120. Your cost curve is superlinear to get linear gains in system size. At a big enough scale, you amortize the cost across your customer base and the economics work.

Contrast that with a sufficiently complex vibecoded app built for a small audience - high complexity costs can't be amortized at small scale. I expect to see many people and companies try and fail at vibecloning complex SaaS in the near term. Complexity cost economics only scale with audience size (I will share another model for this).

I do think SaaS prices will be corrected downwards to account for savings in code generation, but I predict that once the irrational exuberance for vibing fades, we'll see that it still makes sense to buy rather than self-build complex SaaS.

A broader implication is that AI Agents will never be able to self-verify. Humans, too, will never be able to fully verify their behavior, because LLMs are by design of maximal complexity. Did you see the size of those error bars in the latest METR results?[^8] The longer the horizon on a task, the more spread in AI agent outcomes. This is the Barrier in action. Spread is a feature of GenAI, but in practice it means heaps more output to review and verify.

The Complexity Barrier shows you literally won't have time to review it all. At the inflection point of verification complexity, you have to fall back on vibes. The implication for fast-takeoff AGI is even scarier: if AI does reach a point of recursive self-improvement, this theorem suggests it will be structurally impossible to know that behavior is aligned, because you won't be able to completely verify. Drift is bad enough in vibe coding. Runaway AI will drift massively and there's no way of knowing where it will end up.

All that's to say, verification should be the focal point of AI Engineering for the foreseeable future and maybe forever. That is: how do you capture what you want to do, refine that into specifics, and then follow up with automated tests, assertions, evals, and customer feedback to progressively harden your software?

The verification problem is acute now because of how cheap software generation is. Because of the superlinear nature of software verification complexity, companies that push hard on the barrier and successfully shift it right will have a built-in moat versus those who fail to put in the verification work.

---

## What the sliders reveal

Set coverage $$c$$ to 0% and test setup cost $$S$$ to 0. This is a team with no tests: verification is entirely manual and the wall is close. Raise $$c$$ and the dashed line moves right, because automated testing scales $$n^*$$ by $$(1/(1 - c))^{1/\alpha}$$. Raise $$S$$ and the green baseline flattens, because each component honestly costs more to produce, but the wall moves much further out. That trade is almost always worth it.

The "move fast, no tests" configuration is high $$g$$, zero $$S$$, zero $$c$$. Early progress looks great, because the baseline is steep. But $$V(n)$$ is convex: it barely registers for the first few components, then explodes. The transition from headroom to zero velocity is nearly instantaneous, with no gradual slowdown to warn you. A team that writes tests from day one has a visibly lower effective generation rate and appears to be losing the race, until the no-test team stalls. Adding tests after the fact is worse still: the setup cost lands on every existing component at once, a capacity spike at the moment velocity is already near zero.

Capacity does not buy a way out. With $$\alpha = 2$$, $$n^* \propto \sqrt{W}$$, so doubling the team pushes the barrier out by about 41%. The constraint is structural, not a staffing problem. As long as verification cost grows faster than linearly with system size, and it does, because of combinatorial interactions between components, there is a finite ceiling for any given team and process.

## Appendix: The formal model

For readers who want the precise mechanics behind the visualization.

**Axiom 1 (Finite Capacity).** A development team has fixed capacity $$W > 0$$ per sprint. All productive activity, generation and verification, must be funded from $$W$$. No activity can proceed without consuming capacity.

**Axiom 2 (Positive Production Cost).** Each component requires $$g\cdot(1 + S)$$ units of capacity to produce, where $$g > 0$$ is the generation rate and $$S \geq 0$$ is the per-component verification setup cost. We require $$g\cdot(1 + S) < W$$, otherwise no component can be produced at all.

**Axiom 3 (Superlinear Verification).** The human verification cost for a system of $$n$$ components is $$V(n) = (1 - c)\,n^{\alpha}$$, where $$c \in [0, 1)$$ is the fraction of verification automated by tests, and $$\alpha > 1$$ is the interaction exponent. $$V$$ is continuous, monotonically increasing, and unbounded.

**Axiom 4 (Capacity Constraint).** At system size $$n$$, the team must simultaneously fund production and verification from $$W$$:

$$g\cdot(1 + S) + V(n) \leq W$$

Velocity is zero whenever this inequality is violated.

**Definition 1 (Verification Budget).** The verification budget is $$B = W - g\cdot(1 + S)$$. By Axiom 2, $$B > 0$$.

**Definition 2 (Effective Velocity).** The effective velocity at system size $$n$$ is:

$$v(n) = g_{\text{eff}} \cdot \left(1 - \frac{V(n)}{B}\right)$$

where $$g_{\text{eff}} = g \,/\, (1 + S)$$ is the effective generation rate. $$v(n) > 0$$ when $$V(n) < B$$, and $$v(n) = 0$$ when $$V(n) \geq B$$.

**Definition 3 (Complexity Barrier).** The complexity barrier $$n^*$$ is the unique solution to $$V(n^*) = B$$, that is:

$$n^* = \left(\frac{B}{1 - c}\right)^{1/\alpha}$$

This exists and is unique because $$V$$ is continuous, $$V(0) = 0$$, and $$V$$ is unbounded (Axiom 3).

**Theorem 1 (Existence of the Barrier).** For any system satisfying Axioms 1 to 4, there exists a finite $$n^*$$ such that the cumulative development time $$T(n) \to \infty$$ as $$n \to n^*$$. The system cannot reach $$n^*$$ components in finite time.

**Proof.** The cumulative time to reach $$n$$ components is:

$$T(n) = \int_0^n \frac{dn'}{v(n')} = \int_0^n \frac{dn'}{g_{\text{eff}} \cdot \left(1 - V(n')/B\right)}$$

By Definition 3, $$V(n^*) = B$$, so as $$n' \to n^*$$, the denominator $$\left(1 - V(n')/B\right) \to 0$$.

Since $$V$$ is continuous and differentiable near $$n^*$$, we can write $$V(n^*) - V(n^* - \varepsilon) \approx V'(n^*)\cdot\varepsilon$$ for small $$\varepsilon$$. Then near $$n^*$$:

$$1 - \frac{V(n')}{B} \;\approx\; \frac{V'(n^*)\cdot(n^* - n')}{B}$$

so the integrand behaves as:

$$\frac{1}{v(n')} \;\approx\; \frac{B}{g_{\text{eff}} \cdot V'(n^*) \cdot (n^* - n')}$$

This has the form $$C/(n^* - n')$$, which is a logarithmic divergence:

$$\int^{n^*} \frac{dn'}{n^* - n'} = -\ln(n^* - n') \;\to\; \infty$$

Therefore $$T(n) \to \infty$$ as $$n \to n^*$$. The barrier cannot be reached in finite time. ∎

**Corollary 1 (Diminishing returns of capacity).** For the bare case ($$c = 0$$, $$\alpha = 2$$): $$n^* = \sqrt{B} = \sqrt{W - g}$$. Doubling $$W$$ increases $$n^*$$ by a factor of at most $$\sqrt{2}$$. The barrier is sublinear in capacity investment.

**Corollary 2 (The generation-rate trap).** $$\partial n^*/\partial g < 0$$. Increasing generation rate $$g$$ while holding all else constant moves the barrier closer, because it shrinks $$B$$. A faster team hits the wall at a smaller system.

**Corollary 3 (Testing shifts but preserves the barrier).** For any coverage $$c < 1$$ and any $$\alpha > 1$$, $$n^*$$ is finite. Automated testing increases $$n^*$$ by a factor of $$(1/(1 - c))^{1/\alpha}$$ but does not eliminate the barrier. Only $$c = 1$$ (complete verification automation) removes it, but Axiom 3 requires $$c < 1$$, reflecting the irreducible residual of emergent, unautomatable interactions.

**Corollary 4 (Recursive barrier).** Capacity $$W$$ is itself produced by a team of $$m$$ people with coordination cost $$C(m)$$ growing superlinearly. By the same argument, there exists $$m^*$$ beyond which adding people decreases effective $$W$$. The barrier is self-similar across levels of organization.

---

_This essay was first published as [a post on X](https://x.com/whusterj/status/2027771813346820349) on February 28, 2026. This page is the canonical version._

[^1]: [Lehman's laws of software evolution](https://en.wikipedia.org/wiki/Lehman%27s_laws_of_software_evolution), Wikipedia.
[^2]: Edsger W. Dijkstra, [The Humble Programmer (EWD340)](https://www.cs.utexas.edu/~EWD/transcriptions/EWD03xx/EWD340.html), 1972.
[^3]: [Rice's theorem](https://en.wikipedia.org/wiki/Rice%27s_theorem), Wikipedia.
[^4]: Brian Cantwell Smith, [The Limits of Correctness](https://cse.buffalo.edu/~rapaport/Papers/Papers.by.Others/smith.limits.pdf), 1985.
[^5]: Sahil Lavingia, [post on X](https://x.com/shl/status/1940881391216218415), July 2025.
[^6]: Thorsten Ball, [post on X](https://x.com/thorstenball/status/2022310010391302259), February 2026.
[^7]: [Linus's law](https://en.wikipedia.org/wiki/Linus%27s_law), Wikipedia.
[^8]: METR, [Measuring AI Ability to Complete Long Tasks](https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/), March 2025.

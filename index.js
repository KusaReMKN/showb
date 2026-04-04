'use strict';

async function
update()
{
	const last = await fetch('./last.sh').then(r => r.text());
	const [ t, w, i ] = last.split('\t').map(e => +e);
	const d = new Date(t * 1000);
	current.textContent = `
		${d.toLocaleDateString()} ${d.toLocaleTimeString()} 時点で
		${w} W の電力を消費しています。`;
	graph.src = `./graph.sh?${Math.random()}`;
	daygraph.src = `./daygraph.sh?${Math.random()}`;
	weekgraph.src = `./weekgraph.sh?${Math.random()}`;
	if (autoupdate.checked)
		setTimeout(update, 15000);
}

autoupdate.addEventListener('change', _ => autoupdate.checked && update());
update();

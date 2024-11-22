from graphviz import Digraph

dot = Digraph(comment='Graph')
dot.body.extend([
    'rankdir=LR;',
    'node [shape=circle];',
    'edge [splines=line];',
    '1 -> 2 [label="A"];',
    '1 -> 3 [label="B"];',
    '3 -> 5 [label="D"];',
    '2 -> 4 [label="C"];',
    '4 -> 6 [label="E"];',
    '3 -> 2 [label="F1", style=dashed];',
    '5 -> 4 [label="F2", style=dashed];'
])
dot.render('graph', format='png', cleanup=True)

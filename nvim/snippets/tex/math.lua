local ls = require('luasnip')
local utils = require'sniputils'
local captured = utils.captured
local capturedtrim = utils.captured_trim
local mathenv = utils.mathenv
local extras = require("luasnip.extras")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt
local rep = extras.rep
-- local isn = ls.indent_snippet_node

-- autosnippets (https://www.lua.org/pil/20.2.html)
local autosnips = {
    s({ trig='//', name='fraction', priority=1002 }, fmta([[\frac{<>}{<>}]], {i(1), i(2)}), {condition=mathenv}),

    s({ trig='(%b())/', name='frac parenthesis', regTrig=true, priority=1001 },
        fmta([[\frac{<>}{<>}]], {f(capturedtrim,{}), i(1)}), {condition=mathenv}),

    s({ trig='(%b[])/', name='frac parenthesis', regTrig=true, priority=1001 },
        fmta([[\frac{<>}{<>}]], {f(capturedtrim,{}), i(1)}), {condition=mathenv}),

    s({ trig='(\\%a+%b{})/', name='frac around command', regTrig=true, priority=1001 },
        fmta([[\frac{<>}{<>}]], {f(captured,{}), i(1)}), {condition=mathenv}),

    s({ trig='([^$={}()%s%[%]]+)/', name='fancyfrac 1', regTrig=true, priority=1000 },
        fmta([[\frac{<>}{<>}]], {f(captured,{}), i(1)}), {condition=mathenv}),

    s({trig='([^%s])sr', name='squared', regTrig=true, wordTrig=false},
        fmt([[{}^2]], {f(captured, {})}), {condition=mathenv}),

    s({trig='([^%s])cb', name='cubed', regTrig=true, wordTrig=false},
        fmt([[{}^3]], {f(captured, {})}), {condition=mathenv}),

    s({trig='([^%s])inv', name='inverse', regTrig=true, wordTrig=false},
        fmt([[{}^{{-1}}]], {f(captured, {})}), {condition=mathenv}),

    s({trig='([^%s])tp', name='transpose', regTrig=true, wordTrig=false},
        fmt([[{}^{{\top}}]], {f(captured, {})}), {condition=mathenv}),

    s({trig='([A-Za-df-z])(%d)', name='subscript', regTrig=true, wordTrig=false},
        fmt([[{}_{}]], {f(captured, {}, {user_args={1}}), f(captured, {}, {user_args={2}})}), {condition=mathenv}),

    s({trig='([%a])_(%d%d)', name='subscript2', regTrig=true, wordTrig=false},
        fmta([[<>_{<>}]], {f(captured, {}, {user_args={1}}), f(captured, {}, {user_args={2}})}), {condition=mathenv}),

    s({trig='([^%s])pw', name='power', regTrig=true, wordTrig=false},
        fmta([[<>^{<>}]], {f(captured, {}), i(1)}), {condition=mathenv}),

    s({trig='([^%s])sb', name='subscript', regTrig=true, wordTrig=false},
        fmta([[<>_{<>}]], {f(captured, {}), i(1)}), {condition=mathenv}),

    s({trig='([+-]?)(%d+)(e?-?%d*)si', name='SI Unit After Integer', regTrig=true, priority=2000},
        fmta([[\SI{<><><>}{<>}]], {
            f(captured,{},{user_args={1}}),
            f(captured,{},{user_args={2}}),
            f(captured,{},{user_args={3}}),
            i(1)})),

    s({trig='([+-]?)(%d+[.]%d+)(e?-?%d*)si', name='SI Unit After Decimal', regTrig=true, priority=2001},
        fmta([[\SI{<><><>}{<>}]], {
            f(captured,{},{user_args={1}}),
            f(captured,{},{user_args={2}}),
            f(captured,{},{user_args={3}}),
            i(1)})),

    s({trig='=[%s]*([^=]+)bex', name='boxed until equals after', regTrig=true},
        fmta([[= \boxed{<>}]], {f(captured,{})}), {condition=mathenv}),

    s({trig='$(%s*)([^$]+)box', name='boxed inline', regTrig=true, priority=1001},
        fmta([[$<>\boxed{<>}]], {
            f(captured, {}, {user_args={1}}),
            f(captured, {}, {user_args={2}}),
        }), {condition=mathenv}),

    s({trig='^(%s*)(.+)box', name='boxed line', regTrig=true, priority=1000},
        fmta([[<>\boxed{<>}]], {
            f(captured, {}, {user_args={1}}),
            f(captured, {}, {user_args={2}}),
        }), {condition=mathenv}),

    s({trig='([%a])wt', name='wide tilde after', regTrig=true},
        fmta([[\widetilde{<>}]], {f(captured,{})}), {condition=mathenv}),

    s({trig='([%a])vec', name='vec after', regTrig=true, wordTrig=false},
        fmta([[\vec{<>}]], {f(captured,{})}), {condition=mathenv}),

    -- s({trig='([%a])bar', name='bar after', regTrig=true},
    --     fmta([[\overline{<>}]], {f(captured,{})}), {condition=mathenv}),

    s({trig='([%d])bar', name='bar after', regTrig=true},
        fmta([[\bar{<>}]], {f(captured,{})}), {condition=mathenv}),

    s({trig='([%a])dot', name='dot after', regTrig=true},
        fmta([[\dot{<>}]], {f(captured,{})}), {condition=mathenv}),

    s({trig='([%a])hat', name='hat after', regTrig=true},
        fmta([[\hat{<>}]], {f(captured,{})}), {condition=mathenv}),


    -- quick environments
    s({trig='times', name='times', wordTrig=true},
        fmta([[\times ]], {}), {condition=mathenv}),

    s({trig='sqr', name='square root'},
        fmta([[\sqrt{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='txt', name='text environment'},
        fmta([[\text{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='prb', name='probability'},
        fmta([[\Pr{\left[<>\right]}]], {i(1)}), {condition=mathenv}),

    s({trig='...', name='ldots'}, t([[\ldots]]), {condition=mathenv}),

    s({trig='---', name='cdots'}, t([[\cdots]]), {condition=mathenv}),

    s({trig='bb', name='mathbb'},
        fmta([[\mathbb{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='cal', name='mathcal'},
        fmta([[\mathcal{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='wt', name='wide tilde'},
        fmta([[\widetilde{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='vec', name='vector'},
        fmta([[\vec{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='bar', name='bar'},
        fmta([[\overline{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='dot', name='dot'},
        fmta([[\dot{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='hat', name='hat'},
        fmta([[\hat{<>}]], {i(1)}), {condition=mathenv}),

    -- simple character replacements
    s({trig='del', name='nabla'}, t('\\nabla'), {condition=mathenv}),
    s({trig='inf', name='infinity'}, t('\\infty'), {condition=mathenv}),
    s({trig='hbar', name='hbar'}, t('\\hbar'), {condition=mathenv}),
    s({trig='>>', name='much greater'}, t('\\gg '), {condition=mathenv}),
    s({trig='<<', name='much less'}, t('\\ll '), {condition=mathenv}),
    s({trig='=>', name='implies'}, t('\\implies '), {condition=mathenv}),
    s({trig='->', name='to'}, t('\\to '), {condition=mathenv}),
    s({trig='!>', name='maps to'}, t('\\mapsto '), {condition=mathenv}),
    s({trig='!=', name='not equals'}, t('\\neq '), {condition=mathenv}),
    s({trig='real', name='real'}, t('\\mathbb{R} '), {condition=mathenv}),
    s({trig='==', name='ampersand-equals'}, t('&='), {condition=mathenv}),
    s({trig='apr', name='approximately'}, t('\\approx '), {condition=mathenv}),
    s({trig='eqv', name='equivalent'}, t('\\equiv'), {condition=mathenv}),
    s({trig='leqv', name='logical equivalence'}, t('\\leftrightarrow'), {condition=mathenv}),
}

-- non-auto-snippets
local regularsnips = {
    s({trig='sum', name='sum', wordTrig=true},
        fmta([[\sum_{<>}^{<>} ]], {i(1), i(2)}), {condition=mathenv}),

    s({trig='(%d)e', name='times 10 power', regTrig=true, wordTrig=false},
        fmta([[<> \times 10^{<>}]], {f(captured, {}), i(1)}), {condition=mathenv}),

    -- quick environments
    s({trig='ce', name='math mhchem', priority=1001, {condition=mathenv}},
        fmta([[\ce{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='si', name='math siunitx', priority=1001, {condition=mathenv}},
        fmta([[\SI{<>}{<>}]], {i(1), i(2)}), {condition=mathenv}),

    s({trig='ssi', name='math siunitx', priority=1001, {condition=mathenv}},
        fmta([[\si{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='units', name='specify units', priority=1000, {condition=mathenv}},
        fmta([=[\left[\si{<>}\right]]=], {i(1)}), {condition=mathenv}),

    s({trig='int', name='integral'},
        -- fmta([[\int_{<>}^{<>} {<>} \: d{<>}]], {i(1),i(2),i(3),i(4)}), {condition=mathenv}),
        fmta([[\int{<>}]], {i(1)}), {condition=mathenv}),
    s({trig='dint', name='integral'},
        fmta([[\int_{<>}^{<>} {<>} \: d{<>}]], {i(1),i(2),i(3),i(4)}), {condition=mathenv}),

    s({trig='oint', name='integral'},
        -- fmta([[\int_{<>}^{<>} {<>} \: d{<>}]], {i(1),i(2),i(3),i(4)}), {condition=mathenv}),
        fmta([[\oint{<>}]], {i(1)}), {condition=mathenv}),

    s({trig='exp', name='natural exponent'},
        fmta([[\exp <>]], {i(1)}), {condition=mathenv}),

    s({trig='sin', name='sine'},
        fmta([[\sin <>]], {i(1)}), {condition=mathenv}),

    s({trig='cos', name='cosine'},
        fmta([[\cos <>]], {i(1)}), {condition=mathenv}),

    s({trig='tan', name='tangent'},
        fmta([[\tan <>]], {i(1)}), {condition=mathenv}),

    s({trig='asin', name='arcsin'},
        fmta([[\arcsin <>]], {i(1)}), {condition=mathenv}),

    s({trig='acos', name='arccos'},
        fmta([[\arccos <>]], {i(1)}), {condition=mathenv}),

    s({trig='atan', name='arctan'},
        fmta([[\arctan <>]], {i(1)}), {condition=mathenv}),

    s({trig='log', name='log'},
        fmta([[\log <>]], {i(1)}), {condition=mathenv}),

    s({trig='ln', name='ln'},
        fmta([[\ln <>]], {i(1)}), {condition=mathenv}),

    s({trig='dv', name='differentiate'},
        fmta([[\odv{<>}{<>}]], {i(1,'y'), i(2,'t')}), {condition=mathenv}),

    s({trig='pdv', name='partial differentiate'},
        fmta([[\pdv{<>}{<>}]], {i(1,'y'), i(2,'t')}), {condition=mathenv}),

    s({trig='box', name='box'},
        fmt([[\box{{{}}}]], {i(1)}), {condition=mathenv}),

    s({trig='.', name='cdot'}, t('\\cdot '), {condition=mathenv}),

    s({trig='div', name='divergence'},
        fmta([[\nabla \cdot <>]], {i(1)}), {condition=mathenv}),

    s({trig='curl', name='curl'},
        fmta([[\nabla \times <>]], {i(1)}), {condition=mathenv}),

    -- Quantum Mechanics
    s({trig='kbt', name='Boltzmann Temp'},
        t("k_{B}T"), {condition=mathenv}),

    s({trig='dag', name='Hermitian Conjugate'},
        t("^{\\dagger}"), {condition=mathenv}),

    s({trig='o+', name='Direct Sum'},
        t("\\oplus "), {condition=mathenv}),

    s({trig='ox', name='Tensor Product'},
        t("\\otimes "), {condition=mathenv}),

s({trig='bra', name='Bra Vector'},
    fmta([[ \bra{<>} ]], {i(1)}), {condition=mathenv}),

s({trig='ket', name='Ket Vector'},
    fmta([[ \ket{<>} ]], {i(1)}), {condition=mathenv}),

s({trig='brk', name='Bra-Ket Notation'},
    fmta([[ \braket{<>|<>} ]], {i(1), i(2)}), {condition=mathenv}),

s({trig='outer', name='Outer Product'},
    fmta([[ \ket{<>} \bra{<>} ]], {i(1, "\\psi"), i(2, "\\psi")}), {condition=mathenv}),

s({trig='inner', name='Inner Product'},
    fmta([[ \bra{<>} <> \ket{<>}  ]], {i(1, "\\psi"), i(2), i(3, "\\psi")}), {condition=mathenv}),

-- Matrices
s({trig='pmat', name='Parentheses Matrix'},
    fmta([[ \begin{pmatrix} <> \end{pmatrix} ]], {i(1)}), {condition=mathenv}),

s({trig='bmat', name='Brackets Matrix'},
    fmta([[ \begin{bmatrix} <> \end{bmatrix} ]], {i(1)}), {condition=mathenv}),

s({trig='Bmat', name='Braces Matrix'},
    fmta([[ \begin{Bmatrix} <> \end{Bmatrix} ]], {i(1)}), {condition=mathenv}),

s({trig='vmat', name='Vertical Lines Matrix'},
    fmta([[ \begin{vmatrix} <> \end{vmatrix} ]], {i(1)}), {condition=mathenv}),

s({trig='Vmat', name='Double Vertical Lines Matrix'},
    fmta([[ \begin{Vmatrix} <> \end{Vmatrix} ]], {i(1)}), {condition=mathenv}),

s({trig='matrix', name='Plain Matrix'},
    fmta([[ \begin{matrix} <> \end{matrix} ]], {i(1)}), {condition=mathenv}),

s({trig='cases', name='Cases Environment'},
    fmta([[ 
    \begin{cases} 
    <><> 
    \end{cases} ]], {t('\t'), i(1)}), {condition=mathenv}),

s({trig='array', name='Array Environment'},
    fmta([[ \begin{array} <> \end{array} ]], {i(1)}), {condition=mathenv})
}

return regularsnips, autosnips


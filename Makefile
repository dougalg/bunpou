####################################
# Makefile for full.fst

full_lex.txt: lexicon/lex0.txt lexicon/lex1-adj.txt lexicon/lex2-vb.txt lexicon/lex3_v5.txt lexicon/lex4_v1.txt lexicon/lex5_vs.txt lexicon/lex6_vEndings.txt
	cat lexicon/lex0.txt lexicon/lex1-adj.txt lexicon/lex2-vb.txt lexicon/lex3_v5.txt lexicon/lex4_v1.txt lexicon/lex5_vs.txt lexicon/lex6_vEndings.txt > full_lex.txt

lex.fst: full_lex.txt compile_lex.txt
	bash<<!source compile_lex.txt

full.fst: lex.fst compile_fst.txt rules/1_adjectives.txt rules/2_verbs.txt rules/98_filters.txt rules/99_cleanup.txt
	bash<<!source compile_fst.txt

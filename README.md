## Rack based API for English words pronounciation
Words loaded from file and stored in a memory in trie structure. Application is available at Heroku. It has two endpoints:
1. /pronounce/:word
  -> returns pronounciation of a single word. [Example](https://floating-stream-33469.herokuapp.com/pronounce/about)
2. /suggest/:prefix
  -> returns pronounciation of up to 10 words that start with a given prefix. [Example](https://floating-stream-33469.herokuapp.com/suggest/aba)

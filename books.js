// =============================================================
//  என் நூலகம் — book list
//  To add a book: copy one { ... } block, change the details,
//  and put the PDF files inside the pdfs/ folder.
//  Short forms like "sand" or "சாண்டி" are matched automatically,
//  so keywords only need other spellings, nicknames, translations.
// =============================================================

window.LIBRARY = [
  {
    id: "raja-thilagam",
    title: "ராஜ திலகம்",
    titleEn: "Raja Thilagam",
    author: "சாண்டில்யன்",
    authorEn: "Sandilyan",
    genre: ["Historical"],
    language: "Tamil",
    authorKeywords: ["Saandilyan", "Chandilyan", "Bhashyam Iyengar"],
    keywords: ["Rajathilagam", "Raja Tilakam", "Raaja Thilagam", "ராஜதிலகம்",
               "Pallava", "பல்லவர்"],
    parts: [
      { label: "பாகம் 1", file: "pdfs/raja-thilagam/raja_thilagam_1.pdf", pages: 102 },
      { label: "பாகம் 2", file: "pdfs/raja-thilagam/raja_thilagam_2.pdf", pages: 100 },
      { label: "பாகம் 3", file: "pdfs/raja-thilagam/raja_thilagam_3.pdf", pages: 100 },
      { label: "பாகம் 4", file: "pdfs/raja-thilagam/raja_thilagam_4.pdf", pages: 112 }
    ]
  },
  {
  id: "wolf-totem",
  title: "ஓநாய் குலச்சின்னம்",
  titleEn: "Wolf Totem",
  author: "ஜியாங் ரோங்",
  authorEn: "Jiang Rong",
  translator: "சி. மோகன்",
  originalLanguage: "Chinese",
  genre: ["Literary", "Nature"],
  language: "Tamil",
  authorKeywords: ["Jiang Rong", "Lu Jiamin"],
  keywords: ["Wolf Tottem", "ஓநாய்", "Onaai Kulachinnam"],
  parts: [ { label: "முழு நூல்", file: "pdfs/wolf-totem/Onai Kulachinnam_By_C_Mohan.pdf", pages: 0 } ]
  }
];

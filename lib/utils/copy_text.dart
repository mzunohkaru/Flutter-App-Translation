String CheckCopyText(String lang) {
    if (lang == "en-US" || lang == "en-GB") {
      return "Copy";
    } else if (lang == "ja-JP") {
      return "コピーしました";
    } else if (lang == "zh-CN") {
      return "复制";
    } else if (lang == "ko-KR") {
      return "복사";
    } else if (lang == "fr-FR" || lang == "it-IT") {
      return "Copie";
    } else if (lang == "es-ES") {
      return "Copiar";
    } else if (lang == "de-DE") {
      return "Kopieren";
    } else if (lang == "ru-RU") {
      return "Копия";
    } else if (lang == "hi-IN") {
      return "प्रतिलिपि";
    }
    return "XXX";
  }
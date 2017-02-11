package com.apress.faq;

import java.util.Iterator;
import java.util.Vector;

public class FaqCategories {

    private Vector<String> categories = new Vector<String>();

    public FaqCategories() {
        categories.add("Dates and Times");
        categories.add("Strings and StringBuffers");
        categories.add("Threading");
    }

    public Iterator getAllCategories() {
        return categories.iterator();
    }
}

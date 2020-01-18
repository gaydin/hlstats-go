package pagination

// Pagination represents a set of results of pagination calculations.
type Pagination struct {
	total     int
	pagingNum int
	current   int
	numPages  int
}

// NewPagination initialize a new pagination calculation and returns a Pagination as result.
func NewPagination(total, pagingNum, current, numPages int) *Pagination {
	if pagingNum <= 0 {
		pagingNum = 1
	}
	if current <= 0 {
		current = 1
	}
	p := &Pagination{total, pagingNum, current, numPages}
	if p.current > p.TotalPages() {
		p.current = p.TotalPages()
	}
	return p
}

// IsFirst returns true if current page is the first page.
func (p *Pagination) IsFirst() bool {
	return p.current == 1
}

// HasPrevious returns true if there is a previous page relative to current page.
func (p *Pagination) HasPrevious() bool {
	return p.current > 1
}

func (p *Pagination) Previous() int {
	if !p.HasPrevious() {
		return p.current
	}
	return p.current - 1
}

// HasNext returns true if there is a next page relative to current page.
func (p *Pagination) HasNext() bool {
	return p.total > p.current*p.pagingNum
}

func (p *Pagination) Next() int {
	if !p.HasNext() {
		return p.current
	}
	return p.current + 1
}

// IsLast returns true if current page is the last page.
func (p *Pagination) IsLast() bool {
	if p.total == 0 {
		return true
	}
	return p.total > (p.current-1)*p.pagingNum && !p.HasNext()
}

// Total returns number of total rows.
func (p *Pagination) Total() int {
	return p.total
}

// TotalPage returns number of total pages.
func (p *Pagination) TotalPages() int {
	if p.total == 0 {
		return 1
	}
	if p.total%p.pagingNum == 0 {
		return p.total / p.pagingNum
	}
	return p.total/p.pagingNum + 1
}

// Current returns current page number.
func (p *Pagination) Current() int {
	return p.current
}

// PagingNum returns number of page size.
func (p *Pagination) PagingNum() int {
	return p.pagingNum
}

// Page presents a page in the paginater.
type Page struct {
	num       int
	isCurrent bool
}

func (p *Page) Num() int {
	return p.num
}

func (p *Page) IsCurrent() bool {
	return p.isCurrent
}

func getMiddleIdx(numPages int) int {
	if numPages%2 == 0 {
		return numPages / 2
	}
	return numPages/2 + 1
}

// Pages returns a list of nearby page numbers relative to current page.
// If value is -1 means "..." that more pages are not showing.
func (p *Pagination) Pages() []*Page {
	if p.numPages == 0 {
		return []*Page{}
	} else if p.numPages == 1 && p.TotalPages() == 1 {
		// Only show current page.
		return []*Page{{1, true}}
	}

	// Total page number is less or equal.
	if p.TotalPages() <= p.numPages {
		pages := make([]*Page, p.TotalPages())
		for i := range pages {
			pages[i] = &Page{i + 1, i+1 == p.current}
		}
		return pages
	}

	numPages := p.numPages
	offsetIdx := 0
	hasMoreNext := false

	// Check more previous and next pages.
	previousNum := getMiddleIdx(p.numPages) - 1
	if previousNum > p.current-1 {
		previousNum -= previousNum - (p.current - 1)
	}
	nextNum := p.numPages - previousNum - 1
	if p.current+nextNum > p.TotalPages() {
		delta := nextNum - (p.TotalPages() - p.current)
		nextNum -= delta
		previousNum += delta
	}

	offsetVal := p.current - previousNum
	if offsetVal > 1 {
		numPages++
		offsetIdx = 1
	}

	if p.current+nextNum < p.TotalPages() {
		numPages++
		hasMoreNext = true
	}

	pages := make([]*Page, numPages)

	// There are more previous pages.
	if offsetIdx == 1 {
		pages[0] = &Page{-1, false}
	}
	// There are more next pages.
	if hasMoreNext {
		pages[len(pages)-1] = &Page{-1, false}
	}

	// Check previous pages.
	for i := 0; i < previousNum; i++ {
		pages[offsetIdx+i] = &Page{i + offsetVal, false}
	}

	pages[offsetIdx+previousNum] = &Page{p.current, true}

	// Check next pages.
	for i := 1; i <= nextNum; i++ {
		pages[offsetIdx+previousNum+i] = &Page{p.current + i, false}
	}

	return pages
}

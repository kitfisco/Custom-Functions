local a={}local b=loadstring(game:HttpGet("https://raw.githubusercontent.com/kitfisco/Custom-Functions/main/Connection.lua"))()local function c(d)if d then d:Disconnect()d=nil end end;a.WaitForChildWhichIsA=function(self,e,f,g)local h=self:FindFirstChildWhichIsA(e)local i=b.new()if not h then local j;coroutine.wrap(function()wait(f or 5)if f then i:Invoke()else warn("Infinite yield possible on \""..self:GetFullName()..":WaitForChildWhichIsA(\""..e.."\")\"")end end)()local function k(l)if l:IsA(e)then h=l;i:Invoke()end end;if g then j=self.DescendantAdded:Connect(k)else j=self.ChildAdded:Connect(k)end;i.Invoked:Wait()c(j)end;return h end;a.WaitForChildOfClass=function(self,e,f,g)local h=self:FindFirstChildWhichIsA(e)local i=b.new()if not h then local j;coroutine.wrap(function()wait(f or 5)if f then i:Invoke()else warn("Infinite yield possible on \""..self:GetFullName()..":WaitForChildWhichIsA(\""..e.."\")\"")end end)()local function k(l)if l.ClassName==e then h=l;i:Invoke()end end;if g then j=self.DescendantAdded:Connect(k)else j=self.ChildAdded:Connect(k)end;i.Invoked:Wait()c(j)end;return h end;a.WaitForDescendantWhichIsA=function(self,m,f)return a.WaitForChildWhichIsA(self,m,f,true)end;a.WaitForAncestorWhichIsA=a.WaitForDescendantWhichIsA;a.WaitForDescendantOfClass=function(self,m,f)return a.WaitForChildOfClass(self,m,f,true)end;a.WaitForAncestorOfClass=a.WaitForDescendantOfClass;a.GetChildrenWhichAre=function(self,e,g)local h={}local n;if g then n=self:GetDescendants()else n=self:GetChildren()end;if n and#n>0 then for o,l in pairs(n)do if l and l:IsA(e)then table.insert(h,l)end end end;return h end;a.GetChildrenOfClass=function(self,e,g)local h={}local n;if g then n=self:GetDescendants()else n=self:GetChildren()end;if n and#n>0 then for o,l in pairs(n)do if l and l.ClassName==e then table.insert(h,l)end end end;return h end;a.GetDescendantsWhichAre=function(self,e)return a.GetChildrenWhichAre(self,e,true)end;a.GetDescendantsOfClass=function(self,e)return a.GetChildrenOfClass(self,e,true)end;a.WaitForDescendant=function(self,m,f)local h=self:FindFirstChild(m,true)local i=b.new()if not h then local j;coroutine.wrap(function()wait(f or 5)if f then i:Invoke()else warn("Infinite yield possible on \""..self:GetFullName()..":WaitForDescendant(\""..m.."\")\"")end end)()local function k(l)if l.Name==m then h=l;i:Invoke()end end;j=self.DescendantAdded:Connect(k)i.Invoked:Wait()c(j)end;return h end;a.WaitForAncestor=a.WaitForDescendant;a.GetChildrenWhichName=function(self,m,g)local h={}local n;if g then n=self:GetDescendants()else n=self:GetChildren()end;if n and#n>0 then for o,l in pairs(n)do if l and l.Name==m then table.insert(h,l)end end end;return h end;a.GetDescendantWithName=function(self,m)return a.GetChildrenWhichName(self,m,true)end;a.FindNextChild=function(self,...)local p={...}local l,q=self,0;for o,r in pairs(p)do local s=l:FindFirstChild(r)if s then l=s;q+=1 end end;if q==#p then return l end end;a.FindNextChildWhichIsA=function(self,...)local p={...}local l,q=self,0;for o,r in pairs(p)do local s=l:FindFirstChildWhichIsA(r)if s then l=s;q+=1 end end;if q==#p then return l end end;a.FindNextChildOfClass=function(self,...)local p={...}local l,q=self,0;for o,r in pairs(p)do local s=l:FindFirstChildOfClass(r)if s then l=s;q+=1 end end;if q==#p then return l end end;do local t;t=hookmetamethod(game,"__index",newcclosure(function(self,u)if checkcaller()and a[u]then return a[u]end;return t(self,u)end))end;do local v;v=hookmetamethod(game,"__namecall",newcclosure(function(self,...)local w=getnamecallmethod()if checkcaller()and a[w]then return a[w](self,...)end;return v(self,...)end))end